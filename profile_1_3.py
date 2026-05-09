import subprocess
import matplotlib.pyplot as plt
import pandas as pd
import os

PROGRAM_RUN  = "./matrix_multiply.out {} {} {} {} {}"
SEED         = 1234
METHOD       = 0    # baseline function so only the compiler opt changes
MIN_DIM      = 128
MAX_DIM      = 1792
STEP         = 128
REPEAT_COUNT = 3
OPT_FLAGS    = ["", "-O1", "-O2", "-O3"]
OPT_LABELS   = ["-O0 (none)", "-O1", "-O2", "-O3"]

def recompile(opt):
    """Recompile with the given optimisation flag."""
    subprocess.run("make clean", shell=True, check=True)
    subprocess.run(f"make OPT={opt}", shell=True, check=True)

def run_test(L: int, M: int, N: int) -> list[float]:
    cmd = PROGRAM_RUN.format(max(L, 1), max(M, 1), max(N, 1), SEED, METHOD)
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    fields = [x.strip() for x in result.stdout.split(",")]
    return [float(x.split(" ")[-1]) for x in fields]

if __name__ == "__main__":
    os.makedirs("graphs", exist_ok=True)
    all_data = {}

    for opt, label in zip(OPT_FLAGS, OPT_LABELS):
        print(f"\nCompiling with OPT={opt if opt else '-O0'}")
        recompile(opt)
        data = []
        for dim in range(MIN_DIM, MAX_DIM + 1, STEP):
            time_total = 0.0
            L = M = N = 0
            for _ in range(REPEAT_COUNT):
                res = run_test(dim, dim, dim)
                L, M, N = int(res[0]), int(res[1]), int(res[2])
                time_total += res[4]
            time  = time_total / REPEAT_COUNT
            flops = float(L * N * (2 * M - 1)) / time if time != 0 else 0
            data.append([flops, L])
            print(f"  N={dim}  FLOPS={flops:.2e}")
        all_data[label] = pd.DataFrame(data, columns=["FLOPS", "Dimension"])

    figure, axis = plt.subplots(figsize=(10, 5))
    for label, df in all_data.items():
        axis.plot(df["Dimension"], df["FLOPS"], marker="o", linewidth=2,
                  markersize=4, label=label)
    axis.set_xlabel("Matrix Dimension N")
    axis.set_ylabel("FLOPS")
    axis.set_title("Task 1.3 - Compiler optimisation: FLOPS vs matrix size")
    axis.legend()
    axis.grid(True, alpha=0.6)
    plt.tight_layout()
    plt.savefig("graphs/1_3_compiler.png", dpi=200)
    print("\nPlot saved to graphs/1_3_compiler.png")
    plt.show()
