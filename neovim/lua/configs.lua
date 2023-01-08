local HOME = os.getenv( 'HOME' )
local g, o, opt, api = vim.g, vim.o, vim.opt, vim.api
local keyset = vim.keymap.set

o.autoindent = true
o.autowrite = true
o.backup = false
o.cindent = true
o.clipboard = 'unnamedplus'
o.completeopt = 'menuone,noselect'
o.cursorline = true
o.expandtab = true
o.incsearch = true
o.mouse = 'a'
o.number = true
o.relativenumber = false
o.scrolloff = 8
o.shiftwidth = 2
o.signcolumn = 'yes'
o.smartindent = true
o.tabstop = 2
o.termguicolors = true
o.updatetime = 300
o.wildmenu = true
o.writebackup = false

g.rustfmt_autosave = 1

-- Scheme
vim.cmd('colorscheme nord')

-- Treesitter Plugin Setup
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'lua', 'php', 'rust', 'toml' },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting=false,
  },
  ident = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}
