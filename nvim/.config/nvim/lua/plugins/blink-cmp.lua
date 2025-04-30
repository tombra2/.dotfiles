return {
  "saghen/blink.cmp",
  version = "1.*",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  opts = {
    keymap = {
      preset = "enter", -- Oder ein anderer preset wie "default", "simple", etc.
    },
    appearance = {
      nerd_font_variant = "normal",
    },
    completion = {
      trigger = {
        show_on_trigger_character = true,
      },
      documentation = {
        auto_show = false,
      },
    },
    signature = {
      enabled = true,
    },
    sources = {
      default = { "lsp", "path" }, -- Standardquelle
      providers = {
        lsp = {
          min_keyword_length = 2, -- Mindestens 2 Zeichen für LSP-Vervollständigung
          score_offset = 0,
        },
        path = {
          min_keyword_length = 2, -- Mindestens 2 Zeichen für Pfade
        },
        snippets = {
          min_keyword_length = 2, -- Mindestens 2 Zeichen für Snippets
        },
        buffer = {
          min_keyword_length = 5, -- Mindestens 2 Zeichen für Buffer
          max_items = 5,
        },
      },
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
    },
  },
  opts_extend = { "sources.default" },
}
