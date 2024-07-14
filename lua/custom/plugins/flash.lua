return {
  {
    'rainzm/flash-zh.nvim',
    event = 'VeryLazy',
    dependencies = {
      'folke/flash.nvim',
      opts = {
        highlight = {
          backdrop = false,
          matches = false,
        },
      },
    },
    keys = {
      {
        's',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash-zh').jump { chinese_only = false }
        end,
        desc = 'Flash between Chinese',
      },
    },
  },
}
