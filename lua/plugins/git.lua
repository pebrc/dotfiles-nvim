return {
  { "tpope/vim-fugitive" },
  { "tpope/vim-rhubarb" },
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
          vim.keymap.set("n", "<leader>gO", function()
            local line = vim.api.nvim_win_get_cursor(0)[1]
            local file = vim.api.nvim_buf_get_name(0)
            local sha = vim.fn.system(
              string.format("git blame -L %d,%d --porcelain -- %s 2>/dev/null | head -1", line, line, vim.fn.shellescape(file))
            ):match("^(%x+)")
            if not sha or #sha < 40 or sha:match("^0+$") then return end
            local remote = vim.fn.system("git remote get-url origin 2>/dev/null"):gsub("%s+$", "")
            remote = remote:gsub("^git@github%.com:", "https://github.com/"):gsub("%.git$", "")
            if remote:find("github%.com") then
              vim.ui.open(remote .. "/commit/" .. sha)
            end
          end, opts)
        end,
      })
    end,
  },
}
