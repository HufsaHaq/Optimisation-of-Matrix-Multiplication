import subprocess
import matplotlib.pyplot as plt
import pandas as pd
import os

# Task 1.6 - blocking profiler
# recompiles with different BLOCK_SIZE values and tests method 3 at -O3
# run from the directory containing main.c and the makefile

PROGRAM_RUN  = "./matrix_multiply.out {} {} {} {} {}"
SEED         = 1234
METHOD       = 3    # blocked_matrix_multiply()
MIN_DIM      = 128
MAX_DIM      = 2048
STEP         = 128
REPEAT_COUNT = 3
# block sizes must divide evenly into MIN_DIM; all are powers of 2
BLOCK_SIZES  = [8, 16, 32, 64, 128]

def recompile(block_size):
    subprocess.run("make clean", shell=True, check=True)
    subprocess.run(f'make OPT=-O3 DEFS="-DBLOCK_SIZE={block_size}"', shell=True, check=True)

def run_test(L: int, M: int, N: int) -> list[float]:
    cmd = PROGRAM_RUN.format(max(L, 1), max(M, 1), max(N, 1), SEED, METHOD)
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    fields = [x.strip() for x in result.stdout.split(",")]
    return [float(x.split(" ")[-1]) for x in fields]

if __name__ == "__main__":
    os.makedirs("graphs", exist_ok=True)
    all_data = {}

    for bs in BLOCK_SIZES:
        print(f"\nCompiling with BLOCK_SIZE={bs}")
        recompile(bs)
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
        all_data[f"BLOCK_SIZE={bs}"] = pd.DataFrame(data, columns=["FLOPS", "Dimension"])

    figure, axis = plt.subplots(figsize=(10, 5))
    for label, df in all_data.items():
        axis.plot(df["Dimension"], df["FLOPS"], marker="o", linewidth=2,
                  markersize=4, label=label)
    axis.set_xlabel("Matrix Dimension N")
    axis.set_ylabel("FLOPS")
    axis.set_title("Task 1.6 - Blocking: FLOPS vs matrix size for varying block sizes")
    axis.legend()
    axis.grid(True, alpha=0.6)
    plt.tight_layout()
    plt.savefig("graphs/1_6_blocking.png", dpi=200)
    print("\nPlot saved to graphs/1_6_blocking.png")
    plt.show()
