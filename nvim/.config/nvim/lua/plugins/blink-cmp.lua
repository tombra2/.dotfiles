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
      providers = {},
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
    },
  },
  opts_extend = { "sources.default" },
}
