return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    's1n7ax/nvim-window-picker',
  },
  config = function()
    require('neo-tree').setup {
      filesystem = {
        window = {
          mappings = {
            ['P'] = { 'toggle_preview', config = { use_float = false, use_image_nvim = true } },
            ['O'] = 'system_open',
          },
        },

        commands = {
          system_open = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.jobstart { 'pwsh', '-c', string.format('ii "%s"', path) }
          end,
        },

        vim.keymap.set('n', '<leader>tt', '<cmd>Neotree toggle<CR>', { desc = 'Neo-[T]ree [T]oggle' }),
        vim.keymap.set('n', '<leader>tf', '<cmd>Neotree position=float<CR>', { desc = 'Neo-[T]ree [F]loat' }),
        vim.keymap.set('n', '<leader>tl', '<cmd>Neotree position=left<CR>', { desc = 'Neo-[T]ree [L]eft' }),
        vim.keymap.set('n', '<leader>tr', '<cmd>Neotree position=right<CR>', { desc = 'Neo-[T]ree [R]ight' }),
      },
    }
  end,
}
