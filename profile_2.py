import subprocess
import matplotlib.pyplot as plt
import pandas as pd
import os

# Part II - combined optimisation profiler
# compares baseline (method 0) vs combined (method 5) at -O3
# also overlays the best individual methods for comparison
# run from the directory containing main.c and the makefile

PROGRAM_RUN  = "./matrix_multiply.out {} {} {} {} {}"
SEED         = 1234
MIN_DIM      = 128
MAX_DIM      = 2048
STEP         = 128
REPEAT_COUNT = 3

# methods to compare: (method_id, label, recompile_args)
CONFIGS = [
    (0, "baseline -O3",      "OPT=-O3"),
    (2, "multicore -O3",     "OPT=-O3"),
    (3, "blocking -O3",      "OPT=-O3"),
    (4, "SIMD -O3",          "OPT=-O3"),
    (5, "combined -O3",      "OPT=-O3"),
]

def recompile(make_args):
    subprocess.run("make clean", shell=True, check=True)
    subprocess.run(f"make {make_args}", shell=True, check=True)

def run_test(L: int, M: int, N: int, method: int) -> list[float]:
    cmd = PROGRAM_RUN.format(max(L, 1), max(M, 1), max(N, 1), SEED, method)
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    fields = [x.strip() for x in result.stdout.split(",")]
    return [float(x.split(" ")[-1]) for x in fields]

if __name__ == "__main__":
    os.makedirs("graphs", exist_ok=True)

    # all methods use the same compilation, so compile once at -O3
    recompile("OPT=-O3")
    all_data = {}

    for method, label, _ in CONFIGS:
        print(f"\nProfiling: {label}")
        data = []
        for dim in range(MIN_DIM, MAX_DIM + 1, STEP):
            time_total = 0.0
            L = M = N = 0
            for _ in range(REPEAT_COUNT):
                res = run_test(dim, dim, dim, method)
                L, M, N = int(res[0]), int(res[1]), int(res[2])
                time_total += res[4]
            time  = time_total / REPEAT_COUNT
            flops = float(L * N * (2 * M - 1)) / time if time != 0 else 0
            data.append([flops, L])
            print(f"  N={dim}  FLOPS={flops:.2e}")
        all_data[label] = pd.DataFrame(data, columns=["FLOPS", "Dimension"])

    # main comparison plot
    figure, axis = plt.subplots(figsize=(10, 5))
    for label, df in all_data.items():
        lw = 2.5 if "combined" in label else 1.5
        axis.plot(df["Dimension"], df["FLOPS"], marker="o", linewidth=lw,
                  markersize=4, label=label)
    axis.set_xlabel("Matrix Dimension N")
    axis.set_ylabel("FLOPS")
    axis.set_title("Part II - Combined optimisation vs individual methods")
    axis.legend()
    axis.grid(True, alpha=0.6)
    plt.tight_layout()
    plt.savefig("graphs/2_combined.png", dpi=200)
    print("\nPlot saved to graphs/2_combined.png")

    # speedup plot: combined / baseline
    base = all_data["baseline -O3"]
    comb = all_data["combined -O3"]
    speedup = comb["FLOPS"].values / base["FLOPS"].values
    figure2, axis2 = plt.subplots(figsize=(10, 4))
    axis2.plot(base["Dimension"], speedup, marker="o", linewidth=2,
               markersize=5, color="green")
    axis2.axhline(1.0, color="gray", linestyle="--", linewidth=1)
    axis2.set_xlabel("Matrix Dimension N")
    axis2.set_ylabel("Speedup (combined / baseline)")
    axis2.set_title("Part II - Speedup of combined method over -O3 baseline")
    axis2.grid(True, alpha=0.6)
    plt.tight_layout()
    plt.savefig("graphs/2_speedup.png", dpi=200)
    print("Speedup plot saved to graphs/2_speedup.png")
    plt.show()
