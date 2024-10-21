-- lua/raj/plugins/init.lua
return {
    "nvim-lua/plenary.nvim", -- Lua utility
    "christoomey/vim-tmux-navigator", -- Tmux navigator
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- Choose between 'latte', 'frappe', 'macchiato', 'mocha'
                transparent_background = true,
                term_colors = true,
                no_italic = false,
                integrations = {
                    treesitter = true,
                    native_lsp = {
                        enabled = true,
                        virtual_text = {
                            errors = { "italic" },
                            hints = { "italic" },
                            warnings = { "italic" },
                            information = { "italic" },
                        },
                        underlines = {
                            errors = { "underline" },
                            hints = { "underline" },
                            warnings = { "underline" },
                            information = { "underline" },
                        },
                    },
                    lsp_trouble = true,
                    cmp = true,
                    gitsigns = true,
                    telescope = true,
                    nvimtree = true,
                    dashboard = true,
                    bufferline = true,
                    markdown = true,
                    illuminate = true,
                    hop = true,
                    which_key = true,
                    indent_blankline = {
                        enabled = true,
                        colored_indent_levels = false,
                    },
                },
            })

            -- Apply the theme
            vim.cmd("colorscheme catppuccin-mocha")
        end,
    },
}
