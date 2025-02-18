return { -- override nvim-cmp plugin
  "hrsh7th/nvim-cmp",
  -- override the options table that is used in the `require("cmp").setup()` call
  opts = function(_, opts)
    -- opts parameter is the default options table
    -- the function is lazy loaded so cmp is able to be required
    -- modify the mapping part of the table
    local cmp = require "cmp"
    opts.window = {
      completion = cmp.config.window.bordered {
        border = { "", "", "", "", "", "", "", "" },
        col_offset = 4,
        side_padding = 1,
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
      },
      documentation = cmp.config.window.bordered {
        -- border = "rounded",
        -- winhighlight = "NormalFloat:TelescopeNormal,FloatBorder:TelescopeBorder",
        border = "none",
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
      },
    }
  end,
}
