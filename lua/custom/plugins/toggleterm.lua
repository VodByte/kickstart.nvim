return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      shell = vim.fn.executable 'pwsh' == 1 and 'pwsh' or 'powershell',
      shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;',
      shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait',
      shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode',
      shellquote = '',
      shellxquote = '',
      direction = 'float',

      vim.keymap.set('n', '<A-i>', '<cmd>ToggleTerm<CR>', { desc = 'Open float terminal' }),
    }
  end,
}
