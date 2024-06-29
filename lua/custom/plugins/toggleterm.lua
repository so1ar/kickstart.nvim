return {
  'akinsho/toggleterm.nvim',
  config = function()
    require('toggleterm').setup {
      size = 20,
      open_mapping = [[<c-\>]],
      direction = 'float',
      float_opts = {
        border = 'curved',
      },
    }

    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'
  end,
  keys = [[<c-\>]],
  cmd = 'ToggleTerm',
}
