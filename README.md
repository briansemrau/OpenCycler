OpenCycler
==========

TL;DR
-----
OpenCycler stitches multiple print files into a single run with optional cycling and pauses between jobs.

Installation and Usage
----------------------
Run the installer from the project root:
```
./install.sh
```

Then run from anywhere:
```
opencycler [options] file1.3mf file2.3mf ...
```

Direct Python usage:
```
python3 src/opencycler.py [options] file1.3mf file2.3mf ...
```

Arguments
---------
- `-s`, `--start-cycle`: cycle at the beginning of the print
- `-e`, `--skip-end-cycle`: skip cycle at the end of the print
- `-p`, `--pause`: pause between jobs
- `-o`, `--output`: output file name (default: `output.3mf`)
- `-l`, `--loop`: repeat the full file list N times (>= 1)
- `files`: list of `.gcode`/`.3mf` files to print

Supported Ecosystems
--------------------
| Ecosystem | Notes |
| --- | --- |
| Bambu A1 | 3MF input |

Supported Plate Cyclers
-----------------------
| Plate Cycler | Notes |
| --- | --- |
| Chitu | `gcode/chitu/*` templates |

Code Components
---------------
OpenCycler flows like this:
1) CLI parses args, loads each input via the selected ecosystem.
2) Each input becomes an `OC_FilePrint` with gcode, timing, and metadata.
3) A print queue is built by inserting `[cycle]`, `[pause]`, and `[level]`
   steps between `OC_FilePrint` entries.
4) The queue is concatenated into a single gcode stream.
5) The ecosystem writes the final output package (e.g., 3MF with metadata).

Main classes:
- `OC_Ecosystem`: parse input files, extract metadata, and build output bundles.
- `OC_PlateCycler`: supply cycle/pause/level gcode snippets per machine family.
- `OC_Print` and subclasses: `OC_FilePrint`, `OC_CyclePrint`, `OC_PausePrint`,
  `OC_LevelPrint` for queue composition.
- `OC_PrintQueue`: holds ordered prints and aggregates timing/filament usage.

Contributing
------------
Contributions are welcome, especially new ecosystems and plate cyclers.
Please include a short description, sample files if relevant, and a quick test note.

Safety Disclaimer
-----------------
OpenCycler is provided as-is with no warranty. You are responsible for reviewing
generated gcode and operating hardware safely. Always supervise prints, follow
your machine's safety guidance, and stop the process if anything looks unsafe.

License
-------
Copyright (C) 2026 Aaron Chambers.

This project is licensed under the GNU General Public License v3.0 or later.
See `OpenCycler/LICENSE`.
