return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    require("catppuccin").setup {
      color_overrides = {
        mocha = {
          rosewater = "#ffc9c9",
          flamingo = "#ff9f9a",
          pink = "#ffa9c9",
          mauve = "#df95cf",
          lavender = "#a990c9",
          red = "#ff6960",
          maroon = "#f98080",
          peach = "#f9905f",
          yellow = "#f9bd69",
          green = "#b0d080",
          teal = "#a0dfa0",
          sky = "#a0d0c0",
          sapphire = "#95b9d0",
          blue = "#89a0e0",
          text = "#e0d0b0",
          subtext1 = "#d5c4a1",
          subtext0 = "#bdae93",
          overlay2 = "#928374",
          overlay1 = "#7c6f64",
          overlay0 = "#665c54",
          surface2 = "#504844",
          surface1 = "#3a3634",
          surface0 = "#252525",
          base = "#0b0b0b",
          mantle = "#0e0e0e",
          crust = "#080808",
        },
      },
      -- https://github.com/catppuccin/nvim/pull/804#pullrequestreview-3080755868
      custom_highlights = function(C)
        local O = require("catppuccin").options
        return {
          ["@variable.member"] = { fg = C.lavender },                                         -- For fields.
          ["@module"] = { fg = C.lavender, style = O.styles.miscs or { "italic" } },          -- For identifiers referring to modules and namespaces.
          ["@string.special.url"] = { fg = C.rosewater, style = { "italic", "underline" } },  -- urls, links and emails
          ["@type.builtin"] = { fg = C.yellow, style = O.styles.properties or { "italic" } }, -- For builtin types.
          ["@property"] = { fg = C.lavender, style = O.styles.properties or {} },             -- Same as TSField.
          ["@constructor"] = { fg = C.sapphire },                                             -- For constructor calls and definitions: = { } in Lua, and Java constructors.
          ["@keyword.operator"] = { link = "Operator" },                                      -- For new keyword operator
          ["@keyword.export"] = { fg = C.sky, style = O.styles.keywords },
          ["@markup.strong"] = { fg = C.maroon, style = { "bold" } },                         -- bold
          ["@markup.italic"] = { fg = C.maroon, style = { "italic" } },                       -- italic
          ["@markup.heading"] = { fg = C.blue, style = { "bold" } },                          -- titles like: # Example
          ["@markup.quote"] = { fg = C.maroon, style = { "bold" } },                          -- block quotes
          ["@markup.link"] = { link = "Tag" },                                                -- text references, footnotes, citations, etc.
          ["@markup.link.label"] = { link = "Label" },                                        -- link, reference descriptions
          ["@markup.link.url"] = { fg = C.rosewater, style = { "italic", "underline" } },     -- urls, links and emails
          ["@markup.raw"] = { fg = C.teal },                                                  -- used for inline code in markdown and for doc in python (""")
          ["@markup.list"] = { link = "Special" },
          ["@tag"] = { fg = C.mauve },                                                        -- Tags like html tag names.
          ["@tag.attribute"] = { fg = C.teal, style = O.styles.miscs or { "italic" } },       -- Tags like html tag names.
          ["@tag.delimiter"] = { fg = C.sky },                                                -- Tag delimiter like < > /
          ["@property.css"] = { fg = C.lavender },
          ["@property.id.css"] = { fg = C.blue },
          ["@type.tag.css"] = { fg = C.mauve },
          ["@string.plain.css"] = { fg = C.peach },
          ["@constructor.lua"] = { fg = C.flamingo }, -- For constructor calls and definitions: = { } in Lua.
          -- typescript
          ["@property.typescript"] = { fg = C.lavender, style = O.styles.properties or {} },
          ["@constructor.typescript"] = { fg = C.lavender },
          -- TSX (Typescript React)
          ["@constructor.tsx"] = { fg = C.lavender },
          ["@tag.attribute.tsx"] = { fg = C.teal, style = O.styles.miscs or { "italic" } },
          ["@tag.builtin.tsx"] = { fg = C.mauve }, -- Tags like html tag names.
          ["@type.builtin.c"] = { fg = C.yellow, style = {} },
          ["@type.builtin.cpp"] = { fg = C.yellow, style = {} },
          ["@keyword.import.c"] = { fg = C.mauve },
          ["@keyword.import.cpp"] = { fg = C.mauve },
          ["@type"] = { fg = C.yellow },
          ["@constant.c"] = { fg = C.yellow },
          ["@lsp.type.enumMember"] = { fg = C.peach },
          ["@function.macro"] = { fg = C.green }
        }
      end,
    }
    require("catppuccin").load()
  end
}
