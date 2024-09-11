return {
  'willothy/nvim-cokeline',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim', -- Required for v0.4.0+
    'nvim-tree/nvim-web-devicons', -- If you want devicons
  },
  config = function()
    local get_hex = require('cokeline.hlgroups').get_hl_attr

    local green = vim.g.terminal_color_2
    local yellow = vim.g.terminal_color_3
    require('cokeline').setup {
      -- Only show the bufferline when there are at least this many visible buffers.
      show_if_buffers_are_at_least = 2,

      default_hl = {
        fg = function(buffer)
          return buffer.is_focused and get_hex('Normal', 'fg') or get_hex('Comment', 'fg')
        end,
        bg = get_hex('ColorColumn', 'bg'),
      },

      components = {
        {
          text = '｜',
          fg = function(buffer)
            return buffer.is_modified and yellow or green
          end,
        },
        {
          text = function(buffer)
            return buffer.devicon.icon .. ' '
          end,
          fg = function(buffer)
            return buffer.devicon.color
          end,
        },
        -- {
        --   text = function(buffer)
        --     return buffer.index .. ': '
        --   end,
        -- },
        {
          text = function(buffer)
            return buffer.unique_prefix
          end,
          fg = get_hex('Comment', 'fg'),
          italic = true,
        },
        {
          text = function(buffer)
            return buffer.filename .. ' '
          end,
          bold = function(buffer)
            return buffer.is_focused
          end,
        },
        {
          ---@param buffer Buffer
          text = function(buffer)
            if buffer.is_modified then
              return ' '
            end
            return ''
          end,
          on_click = function(_, _, _, _, buffer)
            buffer:delete()
          end,
        },
      },

      sidebar = {
        filetype = { 'NvimTree', 'neo-tree', 'undotree' },
        components = {
          {
            text = function(buf)
              return buf.filetype
            end,
            fg = yellow,
            bg = function()
              return get_hex('NvimTreeNormal', 'bg')
            end,
            bold = true,
          },
        },
      },
    }
  end,
}
