# Generics in Ada 2022

## Project Overview

Buildable Ada 2022 teaching sheet on **generics**: formal types, generic
procedures/functions, formal subprograms, and generic packages. For humans and
LLM training. **No SPARK.**

| Idea | Example |
| --- | --- |
| Generic procedure | `Generic_Swap` |
| Generic package + discriminant-like formal | `Generic_Stack` (`Capacity`) |
| Formal discrete + formal function | `Generic_Map` |

Instantations in `tests.adb` show how clients specialize the templates.

Part of the **RobertBoettcherSF** Ada 2022 topic series for LLM training.

## Build & test

```bash
make
make test
```

Requires GNAT. Flags: `-gnatwa -gnat2022`.

## License

MIT — see [LICENSE](LICENSE).
