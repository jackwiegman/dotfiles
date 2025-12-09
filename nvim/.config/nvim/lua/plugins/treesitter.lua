return {
  { -- Treesitter block

    'nvim-treesitter/nvim-treesitter',
    -- Recommended instal from readme
    branch = 'master',
    lazy = false,
    build = ':TSUpdate',
    --
    main = 'nvim-treesitter.configs', -- Sets main mod to use for opts

    opts = {
      ensure_installed = {
        'awk',
        'bash',
        'bibtex',
        'c',
        'cmake',
        'cpp',
        'css',
        'csv',
        'diff',
        'doxygen',
        'editorconfig',
        -- 'git_commit',
        'git_config',
        'git_rebase',
        'gitattributes',
        'gitcommit',
        'gitignore',
        -- 'go',
        -- 'goctl',
        'gpg',
        'groovy',
        'html',
        'http',
        'hyprlang',
        'hurl', -- runs http requests from a plaintext format
        'ini',
        'java',
        'javascript',
        'javadoc',
        'jq',
        'jsdoc',
        'json',
        'json5',
        'jsonc',
        'kconfig', -- kernel config lang
        'latex',
        -- 'llvm',
        'lua',
        'luadoc',
        'make',
        'markdown',
        'markdown_inline',
        -- 'meson',
        'passwd',
        'php',
        'phpdoc',
        'powershell',
        'printf',
        'pymanifest',
        'python',
        'query',
        'r',
        'regex',
        'requirements', -- pip requirement files
        -- 'rtf',
        'ruby',
        'rust',
        'scheme',
        'sql',
        -- 'sqlite',
        'ssh_config',
        -- 'superhtml', -- adds extra formatting and capabilities
        'sway',
        -- 'tablegen', -- llvm tablegen lang
        -- 'tmux',
        -- 'todotxt', -- todolist parsing
        'toml',
        -- 'typescript',
        'udev',
        'vim',
        'vimdoc',
        'xml',
        -- 'xresources',
        'yaml',
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = {
        enable = true,
        disable = { 'ruby' },
      },
    },
  },
}
