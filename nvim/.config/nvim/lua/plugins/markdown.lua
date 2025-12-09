return { -- Render markdown in the editor
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',

      'echasnovski/mini.nvim', -- if you use the mini.nvim suite
    },
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      latex = {
        converter = 'pdflatex',
        -- converter = 'ltx2unitxt',
        -- render_modes = { 'n', 'c', 't' },
        -- top_pad = 1,
        -- bottom_pad = 0,
      },
      indent = {
        enabled = true,
        skip_level = 2,
        icon = '',
      },
      completions = { lsp = { enabled = true } }, -- Add completions through lsp, will also do with cmp
      heading = {
        width = 'block',
        right_pad = 2,
        backgrounds = {
          'Search',
          'RenderMarkdownH2Bg',
          'RenderMarkdownH3Bg',
          'RenderMarkdownH4Bg',
          'RenderMarkdownH5Bg',
          'RenderMarkdownH6Bg',
        },
      },
    },
  },
}
