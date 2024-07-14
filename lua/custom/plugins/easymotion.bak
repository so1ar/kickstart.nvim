return {
  'zzhirong/vim-easymotion-zh',
  dependencies = { 'easymotion/vim-easymotion' },
  config = function()
    vim.cmd [[
    let g:EasyMotion_leader_key=";"
    let g:EasyMotion_skipfoldedline=0
    let g:EasyMotion_space_jump_first=1
    let g:EasyMotion_move_highlight = 0
    let g:EasyMotion_use_migemo = 1
    ]]
  end,
  keys = {
    {
      '<leader>sp',
      '<Plug>(easymotion-overwin-f2)',
      mode = 'n',
      desc = 'Search Current Page',
    },
  },
}
