import subprocess
import re
import matplotlib.pyplot as plt
import sys
import os

# Task 1.2 - baseline performance profiler

BINARY       = "./matrix_multiply.out"
SEED         = 0
METHOD       = 0
MIN_DIM      = 128
MAX_DIM      = 1792
STEP         = 128
TIMEOUT_S    = 120
REPEAT_COUNT = 3

def flop_count(L, M, N):
    return L * N * (2 * M - 1)

def run_once(n):
    """Run the binary for NxNxN and return elapsed seconds, or None on failure."""
    cmd = [BINARY, str(n), str(n), str(n), str(SEED), str(METHOD)]
    try:
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=TIMEOUT_S)
    except subprocess.TimeoutExpired:
        print(f"  N={n}: timed out after {TIMEOUT_S}s, stopping here")
        return None
    if result.returncode != 0:
        print(f"  ERROR: {result.stderr.strip()}", file=sys.stderr)
        return None
    match = re.search(r"EXEC TIME:\s*(\d+)\.(\d+)", result.stdout)
    if not match:
        print(f"  Could not parse: {result.stdout.strip()}", file=sys.stderr)
        return None
    return int(match.group(1)) + int(match.group(2)) * 1e-6

def main():
    if not os.path.isfile(BINARY):
        sys.exit(f"Binary not found: {BINARY}  -  run 'make' first")

    os.makedirs("graphs", exist_ok=True)
    sizes, flops_list = [], []

    print(f"{'N':>6}  {'Time (s)':>12}  {'FLOPS':>14}")
    print("-" * 38)

    for n in range(MIN_DIM, MAX_DIM + 1, STEP):
        time_total = 0.0
        for _ in range(REPEAT_COUNT):
            elapsed = run_once(n)
            if elapsed is None:
                sys.exit("Stopping early.")
            time_total += elapsed
        time = time_total / REPEAT_COUNT
        flops = flop_count(n, n, n) / time if time != 0 else 0
        sizes.append(n)
        flops_list.append(flops)
        print(f"{n:>6}  {time:>12.6f}  {flops:>14.2f}")

    if not sizes:
        sys.exit("No data collected.")

    fig, ax = plt.subplots(figsize=(9, 5))
    ax.plot(sizes, flops_list, marker="o", linewidth=1.8, markersize=5,
            color="#1f77b4", label="baseline matrix_multiply()")
    ax.set_xlabel("Matrix dimension N  (N x N square)", fontsize=12)
    ax.set_ylabel("Performance (FLOPS) ", fontsize=12)
    ax.set_title("Task 1.2 - Baseline matrix multiply: FLOPS vs matrix size", fontsize=12)
    ax.legend()
    ax.grid(True, linestyle="--", alpha=0.5)
    plt.tight_layout()
    fig.savefig("graphs/task1_2_baseline_flops.png", dpi=150)
    print("\nPlot saved to graphs/task1_2_baseline_flops.png")
    plt.show()

if __name__ == "__main__":
    main()