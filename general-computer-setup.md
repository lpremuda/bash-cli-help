# General Computer Setup

## asdf

## [bash-cli-help](https://github.com/lpremuda/bash-cli-help)

## Docker Desktop

## Evernote

## Homebrew

## [iTerm2](https://iterm2.com/)

## [Nodejs](https://nodejs.org/en)

`npm` and `npx` get installed along with Nodejs.

Installed via `asdf`:

```bash
asdf plugin add nodejs
asdf install nodejs 20.11.0
```

Previous Releases: https://nodejs.org/en/about/previous-releases

## [oh-my-zsh](https://ohmyz.sh/)

## [neovim](https://neovim.io/)

## [NvChad](https://nvchad.com/)

- Within nvim, `<Spacebar> + t + h` to open Theme Switcher menu
- To add `<jk>`/`<kj>` to `<Escape>` mapping, add the following to `${HOME}/.config/nvim/lua/custom/mappings.lua` (Reference doc: https://nvchad.com/docs/config/mappings):

```lua
M.abc = {
  i = {
     ["jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
     ["kj"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
  }
}
```

## [Postgresql](https://www.postgresql.org/)

Installed via `brew`:

```bash
brew install postgresql@16
echo 'export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"' >> ~/.zshrc
```

The `echo` command above is because you get the following message when you install `postgresql@16`:

```bash
postgresql@16 is keg-only, which means it was not symlinked into /opt/homebrew,
because this is an alternate version of another formula.
```

## Postman

## [Python](https://www.python.org/)

Version installed: 3.11.7

Installed via `brew`:

```bash
brew install python
```

Interpreter path: `/opt/homebrew/bin/python3`

Add the following to `~/.zshrc`:

```bash
alias python=/opt/homebrew/bin/python3
```

## [Rectangle](https://rectangleapp.com/)

## VSCode

### Extensions

- Auto Rename Tag
- [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
- [GitLens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
- [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)
- [Prettier - Code formatter](https://prettier.io/)
- [VSCode Neovim](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim) (UNINSTALLED because it doesn't support `<kj>` to `<Escape>` mapping)

    1. Had to go into Extension Settings and set `Vscode-neovim > Neovim Executable Paths: Darwin` to the full path of the `nvim` binary, i.e. `/opt/homebrew/bin/nvim`.

- [Vim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)

    1. Ensure the following is added to `settings.json` file (i.e. Command + P and open `Preferences: Open User Settings (JSON)`)

```json
"vim.insertModeKeyBindings": [
{
    "before": ["j", "k"],
    "after": ["<esc>"]
},
{
    "before": ["k", "j"],
    "after": ["<esc>"]
}
```
