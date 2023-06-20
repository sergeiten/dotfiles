local colors = require("utils.colors")

return {
    provider = "position",
    hl = {
        fg = colors.white,
        bg = colors.background
    },
    right_sep = function()
        return {
            str = " ",
            hl = {
                fg = colors.background,
                bg = colors.background,
            },
        }
    end,
    left_sep = function()
        return {
            str = " ",
            hl = {
                fg = colors.background,
                bg = colors.background,
            },
        }
    end,
}
