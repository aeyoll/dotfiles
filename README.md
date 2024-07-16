# aeyoll's dotfiles

This dotfile collection is managed by [Toml Bombadil](https://github.com/oknozor/toml-bombadil)

Install:
---

### For Linux

```sh
./install.sh
bombadil link -p linux
```

### For MacOS

```sh
./install.sh && ./install_osx.sh
bombadil link -p macos
```

Used tools:
---

- Dotfiles manager: Toml Bombadil
- Prompt: Starship
- Shell: zsh
- Terminal: Alacritty + Tmux
- Theme: Nord

About Tmux
---

- Plugins are managed by tpm

About Zsh
---

- Plugins are managed by Antidote

About Neovim
---

- Plugins are managed by [packer.nvim](https://github.com/wbthomason/packer.nvim)
- Leader key is set to `,`

### Keybindings

- ,k => Move to previous tab
- ,j => Move to next tab
- ,t => Create new tab
- ,h => Split window horizontally
- ,v => Split window vertically
- ,J => Move focus to the bottom of the current window
- ,K => Move focus to the top of the current window
- ,H => Move focus to the far left of the current window
- ,L => Move focus to the far right of the current window

### Used plugins:

#### [toggleterm](https://github.com/akinsho/toggleterm.nvim)

This plugin allows you to toggle terminals in Neovim.

- F12 => Toggle terminal
- ,g => Toggle lazygit

#### [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)

A file explorer tree for Neovim.

- ,n => Toggle nvim-tree

#### [telescope](https://github.com/nvim-telescope/telescope.nvim)

A highly extendable fuzzy finder over lists.

- ,ff => Search file in directory
- ,fb => Search files in buffer

Debug zsh:
---

```sh
time ZSH_DEBUGRC=1 zsh -i -c exit
```