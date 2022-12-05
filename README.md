# Advent22

Working through https://adventofcode.com/2022 by making a swift command line tool.

## Usage

Run `swift run Advent22 --help` to see options.

```
USAGE: advent22 <subcommand>

OPTIONS:
  -h, --help              Show help information.

SUBCOMMANDS:
  day1
  day2
  day3
  etc...
```

General usage is `swift run Advent22 day <input> --flag-for-problem-2`.

For example, looking at day one:

```
$ swift run Advent22 day1 --help

USAGE: advent22 day1 <input> [--top3]

ARGUMENTS:
  <input>                 Input file path.

OPTIONS:
  --top3                  Calculates the total of the top three elves.
  -h, --help              Show help information.
```

Usage would be `swift run Advent22 day ~/some/path/to/input.txt --top3`.
