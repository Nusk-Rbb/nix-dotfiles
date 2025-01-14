return {
  -- add color theme
  { "catppuccin/nvim", name = "catppuccin", priotiry = 1000 },

  { "Shatur/neovim-ayu" },

  { "olivercederborg/poimandres.nvim" },

  {
    "uloco/bluloco.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
  },

  { "mellow-theme/mellow.nvim" },

  -- Configure LazyVim to load catppuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "mellow",
    },
  },
}
