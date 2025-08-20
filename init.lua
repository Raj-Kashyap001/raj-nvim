-- Global Settings
vim.g.mapleader = " "

-- General Options
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.termguicolors = true
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"
vim.o.completeopt = "menu,menuone,noselect"


-- Keybinds
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>ch', ':nohl<CR>')
vim.keymap.set('n', '<leader>f', ':Pick files<CR>')
vim.keymap.set('n', '<leader>h', ':Pick help<CR>')
vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle Tree File Explorer" })
vim.keymap.set("n", "<leader>br", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh Tree File Explorer" })

-- Format on save using LSP
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        vim.lsp.buf.format({ async = true })
    end,
})

-- Show diagnostics on hover
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        local opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = "rounded",
            source = "always",
            prefix = " ",
            scope = "cursor",
        }
        vim.diagnostic.open_float(nil, opts)
    end
})

-- Reduce the time before CursorHold event triggers (default is 4000ms)
vim.o.updatetime = 300

-- Packages
vim.pack.add({
    { src = "https://github.com/catppuccin/nvim" },
    { src = "https://github.com/nvim-tree/nvim-tree.lua" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/echasnovski/mini.pick" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },
    -- nvim-cmp and its sources
    { src = "https://github.com/hrsh7th/nvim-cmp" },
    { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
    { src = "https://github.com/hrsh7th/cmp-buffer" },
    { src = "https://github.com/hrsh7th/cmp-path" },
    { src = "https://github.com/hrsh7th/cmp-cmdline" },
    { src = "https://github.com/L3MON4D3/LuaSnip" },
    { src = "https://github.com/saadparwaiz1/cmp_luasnip" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

-- Plugin setup
require 'mini.pick'.setup()
require 'nvim-tree'.setup()

require 'nvim-treesitter.configs'.setup({
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = { "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = false,

    -- List of parsers to ignore installing (or "all")
    ignore_install = { "all" },

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
        enable = true,
        indent = true,
        incremental_selection = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        disable = { "c", "rust" },
        -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
})

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
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- LSP Config
vim.lsp.enable({ "lua_ls", "clangd", "biome", "pylint", "pyright", "black", "prettier" })

vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            }
        }
    }
})

-- Apply capabilities to other LSP servers
local lsp_servers = { "clangd", "biome", "pyright" }
for _, server in ipairs(lsp_servers) do
    vim.lsp.config(server, {
        capabilities = capabilities,
    })
end

-- Commands
require("catppuccin").setup({
    no_italic = true,
})

vim.cmd('colorscheme catppuccin-mocha')
vim.cmd(':hi statusline guibg=#cba6f7 guifg=#101010')
