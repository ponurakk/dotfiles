return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    vim.opt.termguicolors = true

    require("colorizer").setup({ "*" }, {
      RGB = true,      -- #RGB hex codes
      RRGGBB = true,   -- #RRGGBB hex codes
      names = false,   -- "Name" codes like Blue or blue
      RRGGBBAA = true, -- ##GGBBAA hex codes
      rgb_fn = true,   -- CSS rgb() and rgba() functions
      hsl_fn = true,   -- CSS hsl() and hsla() functions
      css = false,     -- Enable all CSS features rgb_fn, hsl_fn, names, RGB, RRGGBB,
      css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn,
      tailwind = true,
      -- Available modes: foreground, background, virtualtext
      mode = "background", -- set the display mode.
    })
  end
}
