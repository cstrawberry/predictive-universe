PYTHON ?= python3 -B
LAKE ?= lake
LEAN4LEAN_SOURCE ?= /absolute/path/to/lean4lean
VERIFY_WORK ?= $(CURDIR)/.work/reproduction

.PHONY: all check integrity formal examples pdf-check test
all: check

check:
	$(PYTHON) src/check_package.py

integrity:
	$(PYTHON) verify_files.py

formal:
	$(PYTHON) formalization/scripts/run_audit.py --lake "$(LAKE)"

examples:
	$(PYTHON) src/run_current_verification.py --lake "$(LAKE)" --lean4lean-source "$(LEAN4LEAN_SOURCE)" --work-dir "$(VERIFY_WORK)" --stage runtime

pdf-check:
	$(PYTHON) src/build_paper.py --check-pdf

test:
	$(PYTHON) -m unittest discover -v
