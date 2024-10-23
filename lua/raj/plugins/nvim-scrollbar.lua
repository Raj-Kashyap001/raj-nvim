return {
  "petertriho/nvim-scrollbar",
  config = function()
    local colors = require("catppuccin.palettes").get_palette("mocha")

    require("scrollbar").setup({
    handle = {
        color = colors.surface0,
    },
    marks = {
        Search = { color = colors.yellow },
        Error = { color = colors.red },
        Warn = { color = colors.peach },
        Info = { color = colors.blue },
        Hint = { color = colors.teal },
        Misc = { color = colors.mauve },
    }
})
  end

}
