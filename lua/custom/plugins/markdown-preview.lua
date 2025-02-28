return {
  'iamcco/markdown-preview.nvim',
  build = 'cd app && yarn install',
  ft = 'markdown',
  config = function()
    vim.g.mkdp_filetypes = { 'markdown' }
    vim.cmd [[let g:mkdp_browser = 'floorp']]
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
