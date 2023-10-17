return {
  "neovim/nvim-lspconfig",
  dependencies = { "j-hui/fidget.nvim", "folke/neodev.nvim" },
  event = "BufReadPre",
  config = function()
    local on_attach = require "pmizio.on_attach"
    local utils = require "pmizio.utils"

    require("neodev").setup {}

    utils.config_autocmd("LspAttach", {
      callback = function(e)
        local client = vim.lsp.get_client_by_id(e.data.client_id)

        if not client then
          return
        end

        on_attach(client, e.buf)
      end,
    })

    require("fidget").setup {
      text = { spinner = "moon" },
    }
  end,
}
