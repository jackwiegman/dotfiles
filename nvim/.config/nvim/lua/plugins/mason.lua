return {
  { 'Bilal2453/luvit-meta', lazy = true },
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    'olrtg/nvim-emmet',
    lazy = true,
    config = function()
      vim.keymap.set({ 'n', 'v' }, '<leader>xe', require('nvim-emmet').wrap_with_abbreviation)
    end,
  },
  {
    'mfussenegger/nvim-jdtls',
  },
  {
    -- Auto install servers
    'mason-org/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {},
    },
    dependencies = {
      {
        -- Main mason installation and setup
        'mason-org/mason.nvim',
        opts = {
          -- ui = {
          --   icons = {
          --     package_installed = '✓',
          --     package_pending = '➜',
          --     package_uninstalled = '✗',
          --   },
          -- },
        },
      },
      'neovim/nvim-lspconfig',
      'saghen/blink.cmp',
      -- Status updates for LSP
      { 'j-hui/fidget.nvim', opts = {} },
    },
    automatic_enable = {
      exclude = {
        'jdtls',
      },
    },
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = {
        -- SERVERS
        'clangd',
        'lua_ls',
        'emmet_language_server',
        'marksman',
        'jsonls',
        'jdtls',
        'pyright',
        'cssls',
        'ts_ls',

        -- FORMATTERS
        'stylua', -- lua formatter
        'prettierd', -- prettier formatter
      },
    },
    dependencies = {
      'mason-org/mason.nvim',
    },
  },
}
