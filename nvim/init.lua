-- Install plugins
-- Using paq
-- See https://github.com/savq/paq-nvim
require "paq" {
    "savq/paq-nvim",
    "kyazdani42/nvim-web-devicons",
    "windwp/nvim-autopairs",
    "numToStr/Comment.nvim",
    "alvarosevilla95/luatab.nvim",
    "nvim-lualine/lualine.nvim",
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    { "catppuccin/nvim", as = "catppuccin" },
}

-- Configure plugins
require("lualine").setup()
require("Comment").setup()
require("luatab").setup()
require("nvim-autopairs").setup()

-- Keymaps
local opts = { noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = ","
vim.g.maplocalleader = ","
keymap("n", "<Leader>f", ":Ex<CR>", opts)
keymap("n", "<Leader>t", ":tabnew<CR>:Ex<CR>", opts)
keymap("n", "<Leader>v", ":vnew<CR>:Ex<CR>", opts)
keymap("n", "<Leader>h", ":new<CR>:Ex<CR>", opts)
keymap("n", "<Tab>", ":tabn<CR>", opts)
keymap("n", "<S-Tab>", ":tabp<CR>", opts)

-- comment for default bindings
keymap("", "j", "<Left>", opts)
keymap("", "k", "<Down>", opts)
keymap("", "l", "<Up>", opts)
keymap("", ";", "<Right>", opts)
keymap("n", "<C-j>", "<C-W>h", opts)
keymap("n", "<C-k>", "<C-W>j", opts)
keymap("n", "<C-l>", "<C-W>k", opts)
keymap("n", "<C-;>", "<C-W>l", opts)
keymap("n", "H", ":%s//<Left>", opts)
keymap("n", "h", ":%s//g<Left><Left>", opts)

-- uncomment for default bindings
-- keymap("n", "<C-h>", "<C-W>h", opts)
-- keymap("n", "<C-k>", "<C-W>k", opts)
-- keymap("n", "<C-j>", "<C-W>j", opts)
-- keymap("n", "<C-l>", "<C-W>l", opts)
-- keymap("n", "G", ":%s//<Left>", opts)
-- keymap("n", "g", ":%s//g<Left><Left>", opts)

-- Configure nvim
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.hlsearch = false
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.opt.backspace = "indent,eol,start"
vim.opt.clipboard:append("unnamedplus")
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.cmd("colorscheme catppuccin")
vim.opt.laststatus = 3
vim.opt.relativenumber = true
vim.opt.number = true

vim.diagnostic.config({ virtual_text = true })
vim.o.completeopt = "menu,menuone,noselect"
vim.o.pumheight = 10

-- LSPs

-- Rust

vim.lsp.config('rust-analyzer', {
    cmd = {'rust-analyzer'},
    filetypes = {'rust'},
    root_markers = {'Cargo.toml', '.git'},
})
vim.lsp.enable("rust-analyzer")

-- General

function autoformat(client, args)
    if client:supports_method('textdocument/formatting') then
        vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = args.buf,
            callback = function()
            vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
    })
    end
end

function autocomplete(client, args)
    if client:supports_method('textDocument/completion') then
        vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
end

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        autoformat(client, args)
        autocomplete(client, args)
    end,
})
