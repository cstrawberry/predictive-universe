# Public verification records

These records document completed verification runs using symbolic paths for
local file locations, working directories and temporary directories. The
invalid-proof diagnostic includes the panic messages and kernel rejection
without native stack addresses. The package supplies the manuscript sources
and separate engine logs.

`/verification/run`, `/verification/toolchain`, `/publication/package` and `/python`
are labels, not locations on the author's computer. Commands in these records
describe the executed commands using those symbolic locations. Use the commands in the verification and publication
guides to run the checks in your own directories.

The records include proof sources, theorem statements, transition data,
mathematical traces, source and executable hashes, results, exit codes and
execution timestamps. Record hashes and manifests authenticate these public
representations of the executions. They do not authenticate private originals.
The test receipt identifies the package tests and their checked source hashes.

The public validator checks record consistency and rejects personal paths,
including those inside gzip records, PDF objects and PNG text metadata. JSON
files, including `.json.gz`, are parsed before their decoded keys and string
values are checked. Duplicate object entries are all inspected, and malformed
JSON is rejected.
