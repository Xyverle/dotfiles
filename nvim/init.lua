-- Basic configuration

-- Keymaps
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = ","
vim.g.maplocalleader = ","
keymap("n", "<Leader>f", ":Ex<CR>", opts)
keymap("n", "<Leader>t", ":tabnew<CR>:Ex<CR>", opts)
keymap("n", "<Leader>v", ":vnew<CR>:Ex<CR>", opts)
keymap("n", "<Leader>h", ":new<CR>:Ex<CR>", opts)
keymap("n", "<Tab>", ":tabn<CR>", opts)
keymap("n", "<S-Tab>", ":tabp<CR>", opts)
keymap("i", "<C-Space>", "<C-X><C-O>", opts)

-- comment for default bindings
--
-- Note: Ctrl + ; does not work on terminals that don't support the kitty comprehensive keyboard handling protocol
-- See <https://sw.kovidgoyal.net/kitty/keyboard-protocol>
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


-- Basic Configuration
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
vim.opt.signcolumn = "yes"

vim.opt.clipboard = "unnamedplus"
vim.opt.backspace = "indent,eol,start"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.laststatus = 3
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.winborder = "rounded"

vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.pumheight = 10


-- Colorscheme


-- Catppuccin Mocha <https://github.com/catppuccin/catppuccin>
--
-- Modified from <https://github.com/catppuccin/vim>
--
-- Catppuccin NVIM is a bit too complex for me to be able to figure out
local palette = {
    base = "#1e1e2e",
    blue = "#89b4fa",
    crust = "#11111b",
    flamingo = "#f2cdcd",
    green = "#a6e3a1",
    lavender = "#b4befe",
    mantle = "#181825",
    maroon = "#eba0ac",
    mauve = "#cba6f7",
    overlay0 = "#6c7086",
    overlay1 = "#7f849c",
    overlay2 = "#9399b2",
    peach = "#fab387",
    pink = "#f5c2e7",
    red = "#f38ba8",
    rosewater = "#f5e0dc",
    sapphire = "#74c7ec",
    sky = "#89dceb",
    subtext0 = "#a6adc8",
    subtext1 = "#bac2de",
    surface0 = "#313244",
    surface1 = "#45475a",
    surface2 = "#585b70",
    teal = "#94e2d5",
    text = "#cdd6f4",
    yellow = "#f9e2af"
}

local function highlight(group, guifg, guibg, gui, cterm, guisp)
    local cmd = ""
    if guifg then cmd = cmd .. " guifg=" .. guifg end
    if guibg then cmd = cmd .. " guibg=" .. guibg end
    if gui then cmd = cmd .. " gui=" .. gui end
    if cterm then cmd = cmd .. " cterm=" .. cterm end
    if guisp then cmd = cmd .. " guisp=" .. guisp end
    if cmd ~= "" then vim.cmd("hi " .. group .. cmd) end
end

-- Highlighting chunk
-- if some colors look off you can likely change it in here

highlight("Normal", palette.text, palette.base)
highlight("Visual", nil, palette.surface1, "bold", "bold")
highlight("Conceal", palette.overlay1)
highlight("ColorColumn", nil, palette.surface0)
highlight("Cursor", palette.base, palette.rosewater)
highlight("lCursor", palette.base, palette.rosewater)
highlight("CursorIM", palette.base, palette.rosewate)
highlight("CursorColumn", nil, palette.mantle)
highlight("CursorLine", nil, palette.surface0)
highlight("Directory", palette.blue)
highlight("DiffAdd", palette.base, palette.green)
highlight("DiffChange", palette.base, palette.yellow)
highlight("DiffDelete", palette.base, palette.red)
highlight("DiffText", palette.base, palette.blue)
highlight("EndOfBuffer")
highlight("ErrorMsg", palette.red, nil, "bolditalic", "bold,italic")
highlight("VertSplit", palette.crust)
highlight("Folded", palette.blue, palette.surface1)
highlight("FoldColumn", palette.overlay0, palette.base)
highlight("SignColumn", palette.surface1, palette.base)
highlight("IncSearch", palette.surface1, palette.pink)
highlight("CursorLineNR", palette.lavender)
highlight("LineNr", palette.surface1)
highlight("MatchParen", palette.peach, nil, "bold", "bold")
highlight("ModeMsg", palette.text, nil, "bold", "bold")
highlight("MoreMsg", palette.blue)
highlight("NonText", palette.overlay0)
highlight("Pmenu", palette.overlay2, palette.surface0)
highlight("PmenuSel", palette.text, palette.surface1, "bold", "bold")
highlight("PmenuSbar", nil, palette.surface1)
highlight("PmenuThumb", nil, palette.overlay0)
highlight("Question", palette.blue)
highlight("QuickFixLine", nil, palette.surface1, "bold", "bold")
highlight("Search", palette.pink, palette.surface1, "bold", "bold")
highlight("SpecialKey", palette.subtext0)
highlight("SpellBad", palette.base, palette.red)
highlight("SpellCap", palette.base, palette.yellow)
highlight("SpellLocal", palette.base, palette.blue)
highlight("SpellRare", palette.base, palette.green)
highlight("StatusLine", palette.text, palette.mantle)
highlight("StatusLineNC", palette.surface1, palette.mantle)
highlight("StatusLineTerm", palette.text, palette.mantle)
highlight("StatusLineTermNC", palette.surface1, palette.mantle)
highlight("TabLine", palette.surface1, palette.mantle)
highlight("TabLineFill", nil, palette.mantle)
highlight("TabLineSel", palette.green, palette.surface1)
highlight("Title", palette.blue, nil, "bold", "bold")
highlight("VisualNOS", nil, palette.surface1, "bold", "bold")
highlight("WarningMsg", palette.yellow)
highlight("WildMenu", nil, palette.overlay0)
highlight("Comment", palette.overlay0)
highlight("Constant", palette.peach)
highlight("Identifier", palette.text)
highlight("Statement", palette.mauve)
highlight("PreProc", palette.pink)
highlight("Type", palette.yellow)
highlight("Special", palette.pink)
highlight("Underlined", palette.text, palette.base, "underline", "underline")
highlight("Error", palette.red)
highlight("Todo", palette.base, palette.flamingo, "bold", "bold")
highlight("DiagnosticError", palette.red)

highlight("String", palette.green)
highlight("Character", palette.teal)
highlight("Number", palette.peach)
highlight("Boolean", palette.peach)
highlight("Float", palette.peach)
highlight("Function", palette.blue)
highlight("Conditional", palette.red)
highlight("Repeat", palette.red)
highlight("Label", palette.peach)
highlight("Operator", palette.sky)
highlight("Keyword", palette.mauve)
highlight("Include", palette.pink)
highlight("StorageClass", palette.yellow)
highlight("Structure", palette.text)
highlight("Typedef", palette.yellow)
highlight("debugPC", nil, palette.crust)
highlight("debugBreakpoint", palette.overlay0, palette.base)


-- LSP

-- Rust

vim.lsp.config("rust-analyzer", {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { "Cargo.toml", ".git" },
})
vim.lsp.enable("rust-analyzer")

-- Lua

vim.lsp.config("lua-language-server", {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = {
        ".luarc.json",
        ".luarc.jsonc",
        ".luacheckrc",
        ".stylua.toml",
        "stylua.toml",
        "selene.toml",
        "selene.yml",
        ".git",
    }

})
vim.lsp.enable("lua-language-server")

-- General

vim.diagnostic.config({ virtual_text = true })

local function autoformat(client, args)
    if client:supports_method("textdocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = args.buf,
            callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
            end,
        })
    end
end

local function autocomplete(client, args)
    if client:supports_method("textDocument/completion") then
        vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
end

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        autoformat(client, args)
        autocomplete(client, args)
    end,
})


-- StatusLine

local modes = {
    ["n"]   = "NORMAL",
    ["no"]  = "NORMAL",
    ["nov"] = "NORMAL",
    ["noV"] = "NORMAL",
    ["no"] = "NORMAL",
    ["niI"] = "NORMAL",
    ["NiR"] = "NORMAL",
    ["NiV"] = "NORMAL",
    ["nt"]  = "NORMAL",
    ["ntT"] = "NORMAL",
    ["v"]   = "VISUAL",
    ["vs"]  = "VISUAL",
    ["V"]   = "V-LINE",
    ["Vs"]  = "V-LINE",
    [""]   = "V-BLOCK",
    ["s"]  = "V-BLOCK",
    ["s"]   = "SELECT",
    ["S"]   = "S-LINE",
    [""]   = "S-BLOCK",
    ["i"]   = "INSERT",
    ["ic"]  = "INSERT",
    ["ix"]  = "INSERT",
    ["R"]   = "REPLACE",
    ["Rx"]  = "V-REPL",
    ["Rc"]  = "V-REPL",
    ["Rv"]  = "V-REPL",
    ["Rvc"] = "V-REPL",
    ["Rvx"] = "V-REPL",
    ["c"]   = "COMMAND",
    ["cr"]  = "EXPLORE",
    ["cv"]  = "EXPLORE",
    ["cvr"] = "EXPLORE",
    ["ce"]  = "EXPLORE",
    ["r"]   = "PROMPT",
    ["rm"]  = "MORE",
    ["r?"]  = "CONFIRM",
    ["!"]   = "SHELL",
    ["t"]   = "TERM",
}

local function mode()
    local current_mode = vim.api.nvim_get_mode().mode
    return (modes[current_mode] or "UNKNOWN") .. " "
end


local function git_branch()
    local branch = vim.fn.systemlist("git rev-parse --abbrev-ref HEAD 2> /dev/null")
    return " " .. (branch[1] or "NONE") .. " "
end

local statusline_config = {
    left_sep = "",
    right_sep = "",
    sections = {
        { fg = palette.surface0, bg = palette.blue,  func = mode },
        { fg = palette.surface0, bg = palette.peach, func = git_branch },
        { fg = palette.surface0, bg = palette.red,   string = "%f %m" },

        { fg = palette.crust,    bg = palette.crust, string = "%=" }, -- Middle

        { fg = palette.surface0, bg = palette.red,   string = "%l:%c" },
        { fg = palette.surface0, bg = palette.peach, string = "%p%%" },
        { fg = palette.surface0, bg = palette.blue,  string = "%y" },
    }
}

local function statusline_highlight(section)
    local hl_name = "@statusline." .. string.format("%x", section._key)
    vim.api.nvim_set_hl(0, hl_name, { fg = section.fg, bg = section.bg, bold = true })

    if section.string then
        return "%#" .. hl_name .. "# " .. section.string .. " "
    else
        return "%#" .. hl_name .. "# %{v:lua." .. section._func_name .. "()}"
    end
end

local function statusline_transition(section, next_section, left_sep_char, right_sep_char)
    local sep_hl = "@statusline." .. string.format("%x", section._key + 1)

    local section_1 = section._right and next_section.bg or section.bg
    local section_2 = section._right and section.bg or next_section.bg
    vim.api.nvim_set_hl(0, sep_hl, { fg = section_1, bg = section_2, bold = true })
    return "%#" .. sep_hl .. "#" .. (section._right and right_sep_char or left_sep_char)
end

local function statusline_build(sections, left_sep_char, right_sep_char)
    local parts = {}

    for i, section in ipairs(sections) do
        table.insert(parts, statusline_highlight(section))
        local next_section = sections[i + 1]
        if next_section then
            table.insert(parts, statusline_transition(section, next_section, left_sep_char, right_sep_char))
        end
    end

    return table.concat(parts)
end

local function expand_sections(section_array)
    local out = {}
    local right = false
    for i, sec in ipairs(section_array) do
        if sec.string and string.find(sec.string, "%=") then
            right = true
        end
        sec._key = (i - 1) * 2
        sec._right = right
        if sec.func then
            local func_name = "statusline_function_" .. sec._key
            _G[func_name] = sec.func
            sec._func_name = func_name
        end
        table.insert(out, sec)
    end
    return out
end

local function statusline_setup(config)
    local sections = expand_sections(config.sections)
    vim.o.statusline = statusline_build(sections, config.left_sep or "", config.right_sep or "")
end

statusline_setup(statusline_config)
