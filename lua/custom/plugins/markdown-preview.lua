return {
  'iamcco/markdown-preview.nvim',
  build = function()
    vim.fn['mkdp#util#install']()
  end,
  ft = 'markdown',
  config = function()
    vim.g.mkdp_filetypes = { 'markdown' }
    vim.cmd [[let g:mkdp_browser = 'firefox']]
  end,
  keys = {
    {
      '<leader>m',
      ':MarkdownPreviewToggle<CR>',
      mode = '',
      desc = '[M]arkdown Preview',
    },
  },
}
