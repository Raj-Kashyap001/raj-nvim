return {
  'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup{
      -- style_preset = bufferline. -- or bufferline.style_preset.minimal,
      options = {
          bufferline.style_preset.no_italic,
          mode = "tabs",
          offsets = {
              filetype = "NvimTree",
              text = "Explorer",
              highlight = "Directory",
              separator = true -- use a "true" to enable the default, or set your own character
          },
      }
      }
  end

}
