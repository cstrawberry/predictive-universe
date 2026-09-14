#!/usr/bin/env python3
"""Compare bare-term selection with actual scheduler contractions on four jobs."""

from __future__ import annotations

import argparse
from pathlib import Path
import re
import subprocess
import sys


FORMALIZATION = Path(__file__).resolve().parents[1]
sys.dont_write_bytecode = True
sys.path.insert(0, str(FORMALIZATION.parent / "src"))
from local_workspace import LocalWorkspace, absolute_lake
LEAN_SOURCE = r"""import PureSFormal.Research.RootResetInitialContractionPrefix
import PureSFormal.PureS.BalancedActionTree

namespace PureSFormal.Research.ResponseSelectorRegression

open PureSFormal.PureS
open RootResetPersistentResponseSelector

def program (first second : List Bool) : CTS.Program :=
  { period := 2
    period_pos := by decide
    appendant := fun phase => if phase.val = 0 then first else second }

def check (program : CTS.Program) (layout : ActionDispatcher program) :
    Nat → Nat → SchedulerInvariant.Configuration program layout →
      Nat × Bool × Origin
  | 0, index, _ => (index, true, .none)
  | remaining + 1, index, configuration =>
      match FiniteController.seekMutation
          (SchedulerControl.machine program layout) 100000 configuration with
      | none => (index, false, .none)
      | some next =>
          let selected := classify program layout configuration.cursor.erase
          if selected.selected?.map (·.target) == some next.cursor.erase then
            check program layout remaining (index + 1) next
          else
            (index, false, selected.origin)

def trial (first second input : List Bool) : Nat × Bool × Origin :=
  let sourceProgram := program first second
  let layout := BalancedActionTree.dispatcher sourceProgram
  check sourceProgram layout 220 0
    (SchedulerControl.initialConfiguration sourceProgram layout input)

#eval trial [true] [false] [true]
#eval trial [] [] [false]
#eval trial [true, false] [false] [true, false]
#eval trial [] [] []

end PureSFormal.Research.ResponseSelectorRegression
"""


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lake", default="lake", help="Pinned Lake executable")
    arguments = parser.parse_args()
    workspace = LocalWorkspace(FORMALIZATION.parent)
    workspace.output(FORMALIZATION / ".lake")
    environment = workspace.environment()
    lake = absolute_lake(arguments.lake)
    result = subprocess.run(
        [lake, "env", "lean", "--stdin"],
        cwd=FORMALIZATION,
        input=LEAN_SOURCE,
        text=True,
        capture_output=True,
        env=environment,
        check=False,
    )
    if result.returncode:
        raise SystemExit(result.stdout + result.stderr)
    rows = re.findall(
        r"\((\d+), (true|false), "
        r"PureSFormal\.Research\.RootResetPersistentResponseSelector\.Origin\.(\w+)\)",
        result.stdout,
    )
    if rows != [("220", "true", "none")] * 4:
        raise SystemExit("response selector regression failed:\n" + result.stdout)
    print("PASS response selector regressions: 4 jobs, 220 contractions each")


if __name__ == "__main__":
    main()
