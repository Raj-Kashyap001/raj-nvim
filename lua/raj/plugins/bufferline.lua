return {
  'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup{

      -- style_preset = bufferline. -- or bufferline.style_preset.minimal,
      options = {
          mode = "tabs",
          seperator_style = "slanted",
           style_preset = {
                bufferline.style_preset.no_italic,
            },
      
      },
    }
  end

}
