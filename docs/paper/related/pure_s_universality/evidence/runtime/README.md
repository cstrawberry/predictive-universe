# Runtime evidence

The [current execution receipt](../formal/headline-complete/receipt.json)
records successful native differential and small-term runs and interpreted
output/preflight runs. It also binds the successful native worked trace and
the source-machine examples. Logs and source/object snapshots belong to this
same complete verification run. The [evidence guide](../formal/README.md)
describes their compressed storage and checks of the public copies.

Use `python3 -B src/check_runtime_evidence.py` from the package root to check
the saved results. This matches harnesses and project sources to the delivered
files and matches runtime imported objects to the kernel replay snapshot.
It reruns the independent Python validators over the saved output.

For fresh executions, use the runtime command in [VERIFICATION.md](../../VERIFICATION.md).
The native output/preflight attempts failed with stack limits; the complete
declared cases passed using Lean's interpreter. The full enormous padded
encoder seed was not materialized.
