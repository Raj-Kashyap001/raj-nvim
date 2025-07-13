return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "BufAdd",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", -- show buffers, not tabs
        numbers = "ordinal",
        diagnostics = "nvim_lsp",
        separator_style = { "", "" },
        show_close_icon = true,
        show_buffer_close_icons = false,
        always_show_bufferline = true,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    })

    -- Optional keymaps for navigation
    local keymap = vim.keymap.set
    keymap("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
    keymap("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Prev Buffer" })
    keymap("n", "<leader>bd", "<Cmd>bd<CR>", { desc = "Close Buffer" })
  end,
}
