return {
  'lervag/vimtex',
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = 'zathura'
    vim.g.tex_flavor = 'latex'
    vim.gvimtex_quickfix_mode = 0
    vim.opt.conceallevel = 1
    vim.g.tex_conceal = 'abdmg' -- don't show LaTeX logo
    vim.g.vimtex_grammar_textidote = {
      jar = '~/.local/share/textidote.jar',
      args = '--check en --firstlang de',
    }
    vim.g.vimtex_compiler_latexmk = {
      options = {
        '--shell-escape',
      },
    }
  end,
}
