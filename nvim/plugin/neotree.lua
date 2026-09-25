Config.now(function()
  vim.pack.add({
    {
      src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
      version = vim.version.range('3')
    },
    -- dependencies
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/MunifTanjim/nui.nvim",
  })

  require("neo-tree").setup({
    filesystem = {
      follow_current_file = {
        enabled = true,
      },
    },
  })

  vim.keymap.set(
    "n",
    "<leader>et",
    "<cmd>Neotree toggle reveal<cr>",
    { desc = "Toggle file tree" }
  )
end)
