return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 500,
        },
        on_attach = function(bufnr)
          local gs = require("gitsigns")
          local opts = { buffer = bufnr }

          vim.keymap.set("n", "]c", gs.next_hunk, opts)
          vim.keymap.set("n", "[c", gs.prev_hunk, opts)
          vim.keymap.set("n", "<leader>gb", gs.blame_line, opts)
          vim.keymap.set("n", "<leader>gB", gs.blame, opts)
          vim.keymap.set("n", "<leader>gp", gs.preview_hunk, opts)
          vim.keymap.set("n", "<leader>gr", gs.reset_hunk, opts)
        end,
      })
    end,
  },
}
