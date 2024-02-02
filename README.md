# bash-cli-help

## Introduction

This repository contains helper commands that are used to provide references and examples for various CLI tools. It also provides helpful zsh aliases.

The shell scripts contains the code, and the `install.sh` script creates symbolic links for this scripts and adds them to the `$PATH`. The symbolic links are named the same as their binary CLI tool with an "h" appended to the end, which stands for "help". For example, the helper command for `git` is `gith`.

## How to Install
#### Note: Installation assumes you are using the `zsh` shell and have `oh-my-zsh` installed.
&nbsp;

1. Clone this repository:
```shell
$ git clone git@github.com:lpremuda/bash-cli-help.git
```

2. If desired, rename and/or relocate directory.
```shell
mv bash-cli-help /path/to/file
```

3. `cd` into directory:
```shell
cd <directory_name>
```

4. Run `install.sh` (make executable, if necessary):
```shell
$ ./install.sh
```

5. When prompted, reload `~/.zshrc` file:
```shell
source ${HOME}/.zshrc
```

&nbsp;

---
## How to Add New Command

1. Create `<command>_help.sh`, e.g. `go_help.sh`
2. Add `<command>` (e.g. `go`) to `binaries` variable in `help_help.sh`, e.g.
```shell
binaries=("aws" "docker" "eks" "git" "go" "help" "k" "kind")
```
3. Add `<command>h` (e.g. `goh`) to `.gitignore`.
4. Run `./install.sh` to make sure everything works.

&nbsp;

---

## How to Add New Alias

1. Add alias to `cli_help_aliases.zsh`.
2. Run `./install.sh` to copy over the new `cli_help_aliases.zsh` file into the appropriate directory.
3. Reload `~/.zshrc` file:
```shell
source ${HOME}/.zshrc
```


