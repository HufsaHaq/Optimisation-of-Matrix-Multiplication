import subprocess
import matplotlib.pyplot as plt
import pandas as pd

# Task 1.2 - baseline performance profiler
# run from the directory containing matrix_multiply.out

BINARY       = "./matrix_multiply.out"
PROGRAM_RUN  = BINARY + " {} {} {} {} {}"   # L M N seed method
SEED         = 1234
METHOD       = 0    # 0 = baseline matrix_multiply()
MIN_DIM      = 128
MAX_DIM      = 2048
STEP         = 128
REPEAT_COUNT = 3    # average over this many runs per size

def run_test(L: int, M: int, N: int) -> list[float]:
    """Run one experiment and return [L, M, N, method, time_seconds]."""
    cmd = PROGRAM_RUN.format(max(L, 1), max(M, 1), max(N, 1), SEED, METHOD)
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    # output: "L = x, M = x, N = x, METHOD = x, EXEC TIME: s.us"
    fields = [x.strip() for x in result.stdout.split(",")]
    return [float(x.split(" ")[-1]) for x in fields]

if __name__ == "__main__":
    data = []

    for dim in range(MIN_DIM, MAX_DIM + 1, STEP):
        print(f"Running N={dim}")
        time_total = 0.0
        L = M = N = 0

        for _ in range(REPEAT_COUNT):
            res = run_test(dim, dim, dim)
            L, M, N = int(res[0]), int(res[1]), int(res[2])
            time_total += res[4]   # res[3] is METHOD, res[4] is EXEC TIME

        time  = time_total / REPEAT_COUNT
        flops = float(L * N * (2 * M - 1)) / time if time != 0 else 0
        data.append([flops, L])
        print(f"  avg time: {time:.4f}s  FLOPS: {flops:.0f}")

    df = pd.DataFrame(data, columns=["FLOPS", "Dimension"])

    figure, axis = plt.subplots(figsize=(9, 5))
    axis.set_xlabel("Matrix Dimension N")
    axis.set_ylabel("FLOPS")
    axis.set_title("Task 1.2 - Baseline matrix multiply: FLOPS vs matrix size")
    axis.grid(True, alpha=0.6)
    axis.plot(df["Dimension"], df["FLOPS"], marker="o", linewidth=2, markersize=5)
    plt.tight_layout()
    plt.savefig("graphs/1_2_baseline.png", dpi=200)
    print("Plot saved to graphs/1_2_baseline.png")
    plt.show()