# Computer Setup

## asdf

## [bash-cli-help](https://github.com/lpremuda/bash-cli-help)

## Docker Desktop

## Evernote

## Homebrew

## [iTerm2](https://iterm2.com/)

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

## Postman

## VSCode

### Extensions

- [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
- [GitLens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
- [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)
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
