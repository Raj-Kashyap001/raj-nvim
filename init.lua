-- ============================================================================
-- NEOVIM 0.12.0 OPTIMIZED CONFIGURATION
-- ============================================================================

-- Global Settings
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Performance optimizations
vim.loader.enable()    -- Enable bytecode cache
vim.g.loaded_netrw = 1 -- Disable netrw
vim.g.loaded_netrwPlugin = 1

-- ============================================================================
-- GENERAL OPTIONS
-- ============================================================================
local opt = vim.opt

-- UI & Appearance
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.termguicolors = true
opt.winborder = "rounded"
opt.pumheight = 10   -- Completion popup height
opt.cmdheight = 1
opt.laststatus = 3   -- Global statusline
opt.showmode = false -- Don't show mode (status line shows it)

-- Editing & Indentation
opt.wrap = false
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.breakindent = true

-- Search & Navigation
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Splits & Windows
opt.splitright = true
opt.splitbelow = true
opt.equalalways = false

-- System Integration
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- Completion & LSP
opt.completeopt = "menu,menuone,noselect"
opt.updatetime = 250
opt.timeoutlen = 300

-- Performance
opt.lazyredraw = false
opt.ttyfast = true
opt.synmaxcol = 300 -- Limit syntax highlighting for long lines

-- ============================================================================
-- PACKAGES
-- ============================================================================
vim.pack.add({
    -- Theme & UI
    { src = "https://github.com/catppuccin/nvim" },
    { src = "https://github.com/neanias/everforest-nvim" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/echasnovski/mini.icons" },

    -- File Management
    { src = "https://github.com/nvim-tree/nvim-tree.lua" },
    { src = "https://github.com/echasnovski/mini.pick" },

    -- Terminal & Navigation
    { src = "https://github.com/akinsho/toggleterm.nvim" },
    { src = "https://github.com/christoomey/vim-tmux-navigator" },

    -- Auto-completion & Pairs
    { src = "https://github.com/windwp/nvim-autopairs" },
    { src = "https://github.com/windwp/nvim-ts-autotag" },

    -- LSP & Completion
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/hrsh7th/nvim-cmp" },
    { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
    { src = "https://github.com/hrsh7th/cmp-buffer" },
    { src = "https://github.com/hrsh7th/cmp-path" },
    { src = "https://github.com/hrsh7th/cmp-cmdline" },
    { src = "https://github.com/L3MON4D3/LuaSnip" },
    { src = "https://github.com/saadparwaiz1/cmp_luasnip" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },

    -- Treesitter & Syntax
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },

    -- Additional utilities
    { src = "https://github.com/kylechui/nvim-surround" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
})

-- ============================================================================
-- KEYMAPS
-- ============================================================================
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- General Keymaps
keymap('n', '<leader>o', ':update<CR>:source<CR>', opts)
keymap('n', '<leader>ch', ':nohl<CR>', opts)
keymap('n', '<C-s>', ':w<CR>', opts)
keymap('i', '<C-s>', '<Esc>:w<CR>a', opts)
keymap('v', '<C-s>', '<Esc>:w<CR>gv', opts)


-- VS Code like shortcuts
keymap('n', '<C-a>', 'ggVG', opts)  -- Select all
keymap('n', '<C-z>', 'u', opts)     -- Undo
keymap('n', '<C-y>', '<C-r>', opts) -- Redo

-- File operations
keymap('n', '<leader>f', ':Pick files<CR>', opts)
keymap('n', '<C-p>', ':Pick files<CR>', opts) -- VS Code like file picker
keymap('n', '<leader>h', ':Pick help<CR>', opts)
keymap('n', '<leader>/', ':Pick grep_live<CR>', opts)

-- File Explorer
keymap('n', '<C-b>', '<cmd>NvimTreeToggle<CR>', { desc = "Toggle Tree File Explorer" })
keymap('n', '<leader>e', '<cmd>NvimTreeFocus<CR>', { desc = "Focus Tree File Explorer" })
keymap('n', '<leader>br', '<cmd>NvimTreeRefresh<CR>', { desc = "Refresh Tree File Explorer" })

-- Terminal Management (VS Code like)
keymap('n', '<C-`>', '<cmd>ToggleTerm direction=horizontal<CR>', opts)
keymap('n', '<C-S-`>', '<cmd>ToggleTerm direction=float<CR>', opts)
keymap('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical size=80<CR>', opts)
keymap('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal size=15<CR>', opts)
keymap('n', '<leader>tf', '<cmd>ToggleTerm direction=float<CR>', opts)

-- Terminal mode keymaps
keymap('t', '<Esc>', '<C-\\><C-n>', opts) -- Exit terminal mode
keymap('t', '<C-h>', '<cmd>wincmd h<CR>', opts)
keymap('t', '<C-j>', '<cmd>wincmd j<CR>', opts)
keymap('t', '<C-k>', '<cmd>wincmd k<CR>', opts)
keymap('t', '<C-l>', '<cmd>wincmd l<CR>', opts)

-- Window Navigation (VS Code like)
keymap('n', '<C-h>', '<cmd>wincmd h<CR>', opts)
keymap('n', '<C-j>', '<cmd>wincmd j<CR>', opts)
keymap('n', '<C-k>', '<cmd>wincmd k<CR>', opts)
keymap('n', '<C-l>', '<cmd>wincmd l<CR>', opts)

-- Window Splitting
keymap('n', '<leader>sv', '<cmd>vsplit<CR>', { desc = "Split vertically" })
keymap('n', '<leader>sh', '<cmd>split<CR>', { desc = "Split horizontally" })
keymap('n', '<leader>sc', '<cmd>close<CR>', { desc = "Close split" })
keymap('n', '<leader>so', '<cmd>only<CR>', { desc = "Close other splits" })

-- Window Resizing
keymap('n', '<C-Up>', '<cmd>resize +2<CR>', opts)
keymap('n', '<C-Down>', '<cmd>resize -2<CR>', opts)
keymap('n', '<C-Left>', '<cmd>vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', '<cmd>vertical resize +2<CR>', opts)

-- Buffer Navigation
keymap('n', '<Tab>', '<cmd>bnext<CR>', opts)
keymap('n', '<S-Tab>', '<cmd>bprevious<CR>', opts)
keymap('n', '<leader>bd', '<cmd>bdelete<CR>', opts)
keymap('n', '<leader>x', '<cmd>bdelete<CR>', opts) -- Close buffer

-- Text manipulation
keymap('v', '<', '<gv', opts)              -- Stay in indent mode
keymap('v', '>', '>gv', opts)
keymap('v', 'J', ":m '>+1<CR>gv=gv", opts) -- Move text up
keymap('v', 'K', ":m '<-2<CR>gv=gv", opts) -- Move text down

-- LSP Keymaps (cleaner approach - avoiding gr conflicts)
local function setup_lsp_keymaps(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    -- Navigation
    keymap('n', 'gD', vim.lsp.buf.declaration, bufopts)
    keymap('n', 'gd', vim.lsp.buf.definition, bufopts)
    keymap('n', 'gi', vim.lsp.buf.implementation, bufopts)
    keymap('n', 'gt', vim.lsp.buf.type_definition, bufopts)
    keymap('n', 'gR', vim.lsp.buf.references, bufopts) -- Changed from gr to gR

    -- Actions
    keymap('n', 'K', vim.lsp.buf.hover, bufopts)
    keymap('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    keymap('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    keymap('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)

    -- Diagnostics
    keymap('n', '<leader>d', vim.diagnostic.open_float, bufopts)
    keymap('n', '[d', vim.diagnostic.goto_prev, bufopts)
    keymap('n', ']d', vim.diagnostic.goto_next, bufopts)
end

-- ============================================================================
-- AUTOCOMMANDS
-- ============================================================================

-- Format on save using LSP
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        if vim.lsp.get_clients({ bufnr = 0 })[1] then
            vim.lsp.buf.format({ async = false })
        end
    end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end,
})

-- Auto resize panes when window is resized
vim.api.nvim_create_autocmd("VimResized", {
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

-- Close certain filetypes with 'q'
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "help", "startuptime", "qf", "lspinfo" },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        keymap('n', 'q', '<cmd>close<CR>', { buffer = event.buf, silent = true })
    end,
})

-- ============================================================================
-- PLUGIN CONFIGURATIONS
-- ============================================================================

-- Mini.pick setup
require('mini.pick').setup({
    mappings = {
        caret_left  = '<C-h>',
        caret_right = '<C-l>',
    },
    window = {
        config = {
            border = 'rounded',
        },
    },
})

-- Mini.icons setup
require('mini.icons').setup()

-- NvimTree setup
require('nvim-tree').setup({
    disable_netrw = true,
    hijack_netrw = true,
    view = {
        width = 35,
        side = "left",
    },
    renderer = {
        group_empty = true,
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
        },
    },
    filters = {
        dotfiles = false,
        custom = { ".git", "node_modules", ".cache" },
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },
})

-- ToggleTerm setup
require('toggleterm').setup({
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.3
        end
    end,
    open_mapping = [[<C-`>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    direction = 'horizontal',
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = 'rounded',
        width = function()
            return math.floor(vim.o.columns * 0.8)
        end,
        height = function()
            return math.floor(vim.o.lines * 0.8)
        end,
        winblend = 3,
    },
})

-- Autopairs setup
require('nvim-autopairs').setup({
    check_ts = true, -- Enable treesitter
    ts_config = {
        lua = { 'string', 'source' },
        javascript = { 'string', 'template_string' },
        java = false,
    },
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    fast_wrap = {
        map = '<M-e>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
        offset = 0,
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'PmenuSel',
        highlight_grey = 'LineNr',
    },
})

-- Auto-tag setup for HTML/JSX
require('nvim-ts-autotag').setup()

-- Surround setup with sa prefix
require('nvim-surround').setup({
    keymaps = {
        insert = "<C-g>s",
        insert_line = "<C-g>S",
        normal = "sa",
        normal_cur = "saa",
        normal_line = "sA",
        normal_cur_line = "sAA",
        visual = "sa",
        visual_line = "sA",
        delete = "sd",
        change = "sc",
    },
})


-- Gitsigns setup
require('gitsigns').setup({
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
    },
})

-- Lualine setup
require('lualine').setup({
    options = {
        -- theme = 'catppuccin',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        globalstatus = true,
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
})

-- ============================================================================
-- TREESITTER CONFIGURATION
-- ============================================================================
require('nvim-treesitter.configs').setup({
    ensure_installed = {
        "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline",
        "javascript", "typescript", "python", "html", "css", "json", "yaml"
    },
    sync_install = false,
    auto_install = false,
    ignore_install = {},

    highlight = {
        enable = true,
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        additional_vim_regex_highlighting = false,
    },

    indent = {
        enable = true,
        disable = { "yaml" }
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "gsc",
            node_decremental = "grm",
        },
    },
})

-- ============================================================================
-- LSP & COMPLETION SETUP
-- ============================================================================

-- LuaSnip setup
require("luasnip.loaders.from_vscode").lazy_load()

-- nvim-cmp setup
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
        { name = 'path' },
    }),
    formatting = {
        format = function(entry, vim_item)
            -- Add source name
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]",
            })[entry.source.name]
            return vim_item
        end,
    },
})

-- Cmdline completion
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})

-- CMP and Autopairs integration
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

-- LSP capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- LSP Configuration
vim.lsp.enable({ "lua_ls", "clangd", "biome", "pyright" })

-- Lua LSP
vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    on_attach = setup_lsp_keymaps,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        }
    }
})

-- Other LSP servers
local lsp_servers = { "clangd", "biome", "pyright" }
for _, server in ipairs(lsp_servers) do
    vim.lsp.config(server, {
        capabilities = capabilities,
        on_attach = setup_lsp_keymaps,
    })
end

-- LSP Diagnostics configuration
vim.diagnostic.config({
    virtual_text = {
        prefix = "●",
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

-- ============================================================================
-- THEME SETUP
-- ============================================================================
require("catppuccin").setup({
    flavour = "mocha",
    no_italic = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
    },
})

vim.cmd('colorscheme catppuccin-mocha')
vim.cmd('colorscheme everforest')

-- ============================================================================
-- ADDITIONAL OPTIMIZATIONS
-- ============================================================================

-- Disable some built-in plugins for better performance
local disabled_built_ins = {
    "netrw", "netrwPlugin", "netrwSettings", "netrwFileHandlers",
    "gzip", "zip", "zipPlugin", "tar", "tarPlugin",
    "getscript", "getscriptPlugin", "vimball", "vimballPlugin",
    "2html_plugin", "logipat", "rrhelper", "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

-- Set up custom commands
vim.api.nvim_create_user_command('Config', 'edit $MYVIMRC', {})
vim.api.nvim_create_user_command('ConfigReload', 'source $MYVIMRC', {})
