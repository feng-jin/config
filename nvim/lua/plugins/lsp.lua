return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
    },
    config = function()
      local capabilities =
        require("blink.cmp").get_lsp_capabilities()

      vim.lsp.config.lua_ls = {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      }

      vim.lsp.config.pyright = {
        capabilities = capabilities,
      }
      vim.lsp.config.gopls = {
        capabilities = capabilities,
      }

      -- LSP 快捷键绑定
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf }
          -- 跳转相关
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)           -- 跳转到定义
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)          -- 跳转到声明
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)           -- 查看引用
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)       -- 跳转到实现
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)                 -- 显示悬浮文档
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)       -- 重命名
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)  -- 代码操作
        end,
      })
    end,
  },
}

