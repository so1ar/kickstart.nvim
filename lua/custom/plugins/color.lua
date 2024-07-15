return {
  'NvChad/nvim-colorizer.lua',
  events = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('colorizer').setup()
  end,
}
