return {
  'willothy/nvim-cokeline',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim', -- Required for v0.4.0+
    'nvim-tree/nvim-web-devicons', -- If you want devicons
  },
  config = function()
    local get_hex = require('cokeline.hlgroups').get_hl_attr

    local blue = vim.g.terminal_color_12
    local purple = vim.g.terminal_color_13
    local yellow = vim.g.terminal_color_3

    require('cokeline').setup {
      -- Only show the bufferline when there are at least this many visible buffers.
      show_if_buffers_are_at_least = 2,

      default_hl = {
        fg = function(buffer)
          return buffer.is_focused and get_hex('Normal', 'bg') or get_hex('Comment', 'fg')
        end,
        bg = function(buffer)
          if buffer.is_focused then
            if buffer.is_modified then
              return purple
            end
            return blue
          end
          return get_hex('ColorColumn', 'bg')
        end,
      },

      components = {
        -- tails
        {
          text = function(buffer)
            if buffer.is_focused then
              return ''
            end
            return ' '
          end,
          bg = function(buffer)
            if buffer.is_focused then
              if buffer.is_modified then
                return purple
              end
              return blue
            end
            return get_hex('ColorColumn', 'bg')
          end,
          fg = function(buffer)
            if buffer.index == 1 then
              if buffer.is_focused then
                if buffer.is_modified then
                  return purple
                end
                return blue
              end
              return get_hex('ColorColumn', 'bg')
            end
            return get_hex('ColorColumn', 'bg')
          end,
        },

        -- devicons
        {
          text = function(buffer)
            return buffer.devicon.icon .. ' '
          end,
          fg = function(buffer)
            if buffer.is_focused then
              return get_hex('Normal', 'bg')
            end
            if buffer.is_modified then
              return purple
            end
            return buffer.devicon.color
          end,
        },

        -- buffer unique prefix
        {
          text = function(buffer)
            return buffer.unique_prefix
          end,
          italic = true,
        },

        -- filename
        {
          text = function(buffer)
            return buffer.filename
          end,
          bold = function(buffer)
            return buffer.is_focused
          end,
        },

        -- separator
        {
          text = function(buffer)
            if buffer.is_focused then
              return ''
            end
            return ' '
          end,
          bg = function()
            return get_hex('ColorColumn', 'bg')
          end,
          fg = function(buffer)
            if buffer.is_focused then
              if buffer.is_modified then
                return purple
              end
              return blue
            end
            return get_hex('ColorColumn', 'bg')
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
              return get_hex('ColorColumn', 'bg')
            end,
            bold = true,
          },
        },
      },
    }
  end,
}
