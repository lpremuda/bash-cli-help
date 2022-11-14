# bash-cli-help

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
## How to Add New Program

1. Create `<command>_help.sh`, e.g. `go_help.sh`
2. Add `<command>h` (e.g. `goh`) to `binaries` variable in `help_help.sh`, e.g.
```shell
binaries=("aws" "docker" "eks" "git" "go" "help" "k" "kind")
```
3. Add `<command>h` (e.g. `goh`) to `.gitignore`.
4. Run `./install.sh` to make sure everything works.
----


