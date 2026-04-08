return {
  {
    "ibhagwan/fzf-lua",
    config = function()
      require("fzf-lua").setup({})
    end,
    keys = {
      { "<leader>ff", "<cmd>FzfLua files<cr>",    desc = "Find files" },
      { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Live grep" },
      { "<leader>fb", "<cmd>FzfLua buffers<cr>",   desc = "Buffers" },
      { "<leader>fs", "<cmd>FzfLua grep_cword<cr>",   desc = "Grep word under cursor" },
      { "<leader>fg", "<cmd>FzfLua grep_visual<cr>", desc = "Grep visual selection", mode = "v" },
    },
  },
}
