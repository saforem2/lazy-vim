return {
  {
    "AntonVanAssche/md-headers.nvim",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- 'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require("md-headers").setup({
        width = 60,
        height = 10,
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        popup_auto_close = true,
      })
    end,
  },

  {
    "ojroques/nvim-osc52",
    keys = {
      {
        "<leader>y",
        function()
          return require("osc52").copy_operator()
        end, -- <-- previously I wasn't using a return statement here
        desc = "copy selection to system clipboard (normal mode)",
        expr = true,
      },
      {
        "<leader>Y",
        "<leader>y_",
        remap = true,
        desc = "copy current line into system clipboard (normal mode)",
      },
      {
        mode = "v",
        "<leader>y",
        function()
          require("osc52").copy_visual()
        end,
        desc = "copy selection to system clipboard (visual mode)",
      },
    },
  },
  -- { "navarasu/onedark.nvim.git", name="navarasu-onedark", lazy = false },
  { "saforem2/glitz", lazy = false, enabled = true },
  { "p00f/nvim-ts-rainbow" },

  { "NTBBloodbath/doom-one.nvim" },
  { "marko-cerovac/material.nvim" },
  { "sainnhe/sonokai" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "tanvirtin/monokai.nvim" },
  { "wakatime/vim-wakatime" },
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      require("rainbow-delimiters.setup").setup({})
    end,
  },

  {
    "preservim/vim-markdown",
    dependencies = { "godlygeek/tabular" },
    config = function()
      -- vim.cmd[[
      --   autogroup markdownmappings
      --     autocmd!
      --     autocmd FileType markdown nmap <buffer> ]] <Plug>Markdown_MoveToNextHeader
      --     autocmd FileType markdown nmap <buffer> [[ <Plug>Markdown_MoveToPreviousHeader
      -- ]]
    end,
  },

  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup()
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
  -- { -- install without yarn or npm
  --   "iamcco/markdown-preview.nvim",
  --   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --   ft = { "markdown" },
  --   build = function()
  --     vim.fn["mkdp#util#install"]()
  --   end,
  -- },
  {
    "MeanderingProgrammer/markdown.nvim",
    name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
    ft = { "markdown", "quarto" },
    dependencies = {
      { "nvim-treesitter/nvim-treesitter" },
      {
        "echasnovski/mini.icons",
        version = false,
        config = function()
          require("mini.icons").setup()
        end,
      },
      -- { "echasnovski/mini.icons" },
      {
        "tadmccorkle/markdown.nvim",
        event = "VeryLazy",
        ft = { "markdown", "quarto" },
        opts = {
          mappings = {
            inline_surround_toggle = "gs", -- (string|boolean) toggle inline style
            inline_surround_toggle_line = "gss", -- (string|boolean) line-wise toggle inline style
            inline_surround_delete = "ds", -- (string|boolean) delete emphasis surrounding cursor
            inline_surround_change = "cs", -- (string|boolean) change emphasis surrounding cursor
            link_add = "gl", -- (string|boolean) add link
            link_follow = "gx", -- (string|boolean) follow link
            go_curr_heading = "]c", -- (string|boolean) set cursor to current section heading
            go_parent_heading = "]p", -- (string|boolean) set cursor to parent section heading
            go_next_heading = "]]", -- (string|boolean) set cursor to next section heading
            go_prev_heading = "[[", -- (string|boolean) set cursor to previous section heading
          },
        },
      },
    },
    config = function()
      require("render-markdown").setup({
        win_options = {
          conceallevel = {
            -- Used when not being rendered, get user setting
            default = vim.api.nvim_get_option_value("conceallevel", {}),
            -- Used when being rendered, concealed text is completely hidden
            rendered = 0,
          },
        },
        file_types = {
          "markdown",
          "quarto",
        },
      })
    end,
  },

  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function()
      --   require("codeium").setup({})
      vim.g.codeium_disable_bindings = 1
      vim.keymap.set("i", "<C-g>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })
      vim.keymap.set("i", "<c-;>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true })
      vim.keymap.set("i", "<c-,>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true })
      vim.keymap.set("i", "<c-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true })
    end,
    -- dependencies = {
    --   "nvim-lua/plenary.nvim",
    --   "hrsh7th/nvim-cmp",
    -- },
    -- lazy = false,
    -- enabled = true,
    -- config = function() require("codeium").setup {} end,
  },

  {
    -- "code-stats/code-stats-vim",
    "https://gitlab.com/code-stats/code-stats-vim.git",
    config = function()
      -- REQUIRED: set your API key
      -- TODO: Replace with environment variable ??
      vim.g["codestats_api_key"] = { os.getenv("CODESTATS_API_KEY") }
      -- vim.g['codestats_api_key'] = {os.getenv('CODESTATS_API_KEY')}
    end,
  },

  -- color html colors
  {
    "NvChad/nvim-colorizer.lua",
    enabled = true,
    opts = {
      filetypes = { "*" },
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = true, -- "Name" codes like Blue or blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = false, -- 0xAARRGGBB hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes for `mode`: foreground, background,  virtualtext
        mode = "virtualtext", -- Set the display mode.
        -- Available methods are false / true / "normal" / "lsp" / "both"
        -- True is same as normal
        tailwind = true, -- Enable tailwind colors
        -- parsers can contain values used in |user_default_options|
        sass = { enable = true, parsers = { "css" } }, -- Enable sass colors
        virtualtext = "■",
        -- update color values even if buffer is not focused
        -- example use: cmp_menu, cmp_docs
        always_update = false,
        -- all the sub-options of filetypes apply to buftypes
      },
      buftypes = {},
    },
  },
}
