return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {
      vim.keymap.set('n', '<leader>tt', '<cmd>Neotree toggle<CR>', { desc = 'Neo-[T]ree [T]oggle' }),
      vim.keymap.set('n', '<leader>tf', '<cmd>Neotree float<CR>', { desc = 'Neo-[T]ree [F]loat' }),
    }
  end,
}
