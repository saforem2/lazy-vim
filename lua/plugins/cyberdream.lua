-- ## 🎨 Palette
--
-- Dark
--
-- | 🖌                                                        | Hex       | Color       |
-- | --------------------------------------------------------- | --------- | ----------- |
-- | ![#16181a](https://place-hold.it/15/16181a/16181a?text=+) | `#16181a` | bg          |
-- | ![#1e2124](https://place-hold.it/15/1e2124/1e2124?text=+) | `#1e2124` | bgAlt       |
-- | ![#3c4048](https://place-hold.it/15/3c4048/3c4048?text=+) | `#3c4048` | bgHighlight |
-- | ![#ffffff](https://place-hold.it/15/ffffff/ffffff?text=+) | `#ffffff` | fg          |
-- | ![#7b8496](https://place-hold.it/15/7b8496/7b8496?text=+) | `#7b8496` | grey        |
-- | ![#5ea1ff](https://place-hold.it/15/5ea1ff/5ea1ff?text=+) | `#5ea1ff` | blue        |
-- | ![#5eff6c](https://place-hold.it/15/5eff6c/5eff6c?text=+) | `#5eff6c` | green       |
-- | ![#5ef1ff](https://place-hold.it/15/5ef1ff/5ef1ff?text=+) | `#5ef1ff` | cyan        |
-- | ![#ff6e5e](https://place-hold.it/15/ff6e5e/ff6e5e?text=+) | `#ff6e5e` | red         |
-- | ![#f1ff5e](https://place-hold.it/15/f1ff5e/f1ff5e?text=+) | `#f1ff5e` | yellow      |
-- | ![#ff5ef1](https://place-hold.it/15/ff5ef1/ff5ef1?text=+) | `#ff5ef1` | magenta     |
-- | ![#ff5ea0](https://place-hold.it/15/ff5ea0/ff5ea0?text=+) | `#ff5ea0` | pink        |
-- | ![#ffbd5e](https://place-hold.it/15/ffbd5e/ffbd5e?text=+) | `#ffbd5e` | orange      |
-- | ![#bd5eff](https://place-hold.it/15/bd5eff/bd5eff?text=+) | `#bd5eff` | purple      |
--
-- Light
--
-- | 🖌                                                        | Hex       | Color       |
-- | --------------------------------------------------------- | --------- | ----------- |
-- | ![#ffffff](https://place-hold.it/15/ffffff/ffffff?text=+) | `#ffffff` | bg          |
-- | ![#eaeaea](https://place-hold.it/15/eaeaea/eaeaea?text=+) | `#eaeaea` | bgAlt       |
-- | ![#acacac](https://place-hold.it/15/acacac/acacac?text=+) | `#acacac` | bgHighlight |
-- | ![#16181a](https://place-hold.it/15/16181a/16181a?text=+) | `#16181a` | fg          |
-- | ![#7b8496](https://place-hold.it/15/7b8496/7b8496?text=+) | `#7b8496` | grey        |
-- | ![#0057d1](https://place-hold.it/15/0057d1/0057d1?text=+) | `#0057d1` | blue        |
-- | ![#008b0c](https://place-hold.it/15/008b0c/008b0c?text=+) | `#008b0c` | green       |
-- | ![#008c99](https://place-hold.it/15/008c99/008c99?text=+) | `#008c99` | cyan        |
-- | ![#d11500](https://place-hold.it/15/d11500/d11500?text=+) | `#d11500` | red         |
-- | ![#997b00](https://place-hold.it/15/997b00/997b00?text=+) | `#997b00` | yellow      |
-- | ![#d100bf](https://place-hold.it/15/d100bf/d100bf?text=+) | `#d100bf` | magenta     |
-- | ![#f40064](https://place-hold.it/15/f40064/f40064?text=+) | `#f40064` | pink        |
-- | ![#d17c00](https://place-hold.it/15/d17c00/d17c00?text=+) | `#d17c00` | orange      |
-- | ![#a018ff](https://place-hold.it/15/a018ff/a018ff?text=+) | `#a018ff` | purple      |
return {
  config = function()
    require("cyberdream").setup({
      -- Enable transparent background
      transparent = false,
      -- Enable italics comments
      italic_comments = false,

      -- Replace all fillchars with ' ' for the ultimate clean look
      hide_fillchars = false,

      -- Modern borderless telescope theme
      borderless_telescope = true,

      -- Set terminal colors used in `:terminal`
      terminal_colors = true,

      -- Use caching to improve performance - WARNING: experimental feature - expect the unexpected!
      -- Early testing shows a 60-70% improvement in startup time. YMMV. Disables dynamic light/dark theme switching.
      cache = false, -- generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache

      theme = {
        variant = "default", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`
        highlights = {
          -- Highlight groups to override, adding new groups is also possible
          -- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values

          -- Example:
          -- Comment = { fg = "#696969", bg = "NONE", italic = true },
          Normal = { fg = "#cccccc" },
          Identifier = { fg = "#eeeeee" },
          Keyword = { fg = "#00CCFF" },
          CursorLine = { bg = "#252525" },
          Comment = { italic = false, fg = "#555555" },
          -- ["@variable"] = { fg = "#cccccc" },
          -- ["@property"] = { fg = colors.blue, bold = true },
          -- hi TreesitterContextBottom gui=underline guisp=Grey
          -- hi TreesitterContextLineNumberBottom gui=underline guisp=Grey
          -- sym"@variable" = { fg = ""},
          -- Keyword = { fg = "#00CCFF" },

          -- Complete list can be found in `lua/cyberdream/theme.lua`
        },

        -- Override a highlight group entirely using the color palette
        overrides = function(colors) -- NOTE: This function nullifies the `highlights` option
          -- Example:
          return {
            ["@variable"] = { fg = "#cccccc" },
            ["@keyword.conditional"] = { fg = "#FF3BD3" },
            ["@variable.member"] = { fg = "#FA99CD" },
            ["@Identifier"] = { fg = "#65d8ee", bold = true },
          }
        end,

        -- Override a color entirely
        colors = {
          -- For a list of colors see `lua/cyberdream/colours.lua`
          -- Example:
          bg = "#1c1c1c",
          -- green = "#00ff00",
          -- magenta = "#ff00ff",
        },
      },
      -- Disable or enable colorscheme extensions
      extensions = {
        telescope = true,
        notify = true,
        mini = true,
      },
    })
  end,
}
