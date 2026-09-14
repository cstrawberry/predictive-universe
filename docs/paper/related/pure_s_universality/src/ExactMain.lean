import Lean4Lean.Replay

/-- Exact module selection and sequential scheduling; checker logic is upstream. -/
unsafe def main (args : List String) : IO UInt32 := do
  Lean.initSearchPath (← Lean.findSysroot)
  let (fresh, names) := match args with
    | "--fresh" :: names => (true, names)
    | names => (false, names)
  if names.isEmpty || (fresh && names.length != 1) then
    throw <| IO.userError "Supply exact modules, or --fresh followed by one module"
  if names.any (·.startsWith "-") || names.eraseDups.length != names.length then
    throw <| IO.userError "Unknown flags or duplicate modules"
  let mut total := 0
  for name in names do
    let module := name.toName
    if module.isAnonymous then throw <| IO.userError "Anonymous module"
    IO.println s!"replaying {module}"
    let count ← if fresh then Lean4Lean.Replay.replayFromFresh module
      else Lean4Lean.Replay.replayFromImports module
    IO.println s!"passed {module} declarations={count}"
    total := total + count
  IO.println s!"checked {total} declarations"
  return 0
