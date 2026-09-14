import Lean
unsafe def main (args : List String) : IO Unit := do
  Lean.initSearchPath (← Lean.findSysroot)
  let target := (args.headD "").toName
  let path ← Lean.findOLean target
  let (data, region) ← Lean.readModuleData path
  IO.println s!"OWN_DECLARATIONS {data.constNames.size}"
  for entry in data.imports do
    IO.println s!"DIRECT {entry.module}"
  Lean.withImportModules #[{ module := target }] {} fun env => do
    for name in env.allImportedModuleNames do
      IO.println s!"COVERED {name}"
  region.free
