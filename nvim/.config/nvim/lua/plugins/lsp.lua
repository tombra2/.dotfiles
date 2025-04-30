return {
  "neovim/nvim-lspconfig",
  opts = {

    servers = {
      emmet_language_server = {
        filetypes = { "html", "twig" },
      },
      html = {
        filetypes = { "html" },
      },
      phpactor = {},
      intelephense = false,
      twiggy_language_server = {},
      jdtls = {},
      bashls = {},
      marksman = {},
      lua_ls = {
        settings = {
          Lua = {
            completion = {},
          },
        },
      },
    },
  },
}
