return {
  -- add color theme
  { "catppuccin/nvim", name = "catppuccin", priotiry = 1000 },

  { "Shatur/neovim-ayu" },

  { "olivercederborg/poimandres.nvim" },

  { "rebelot/kanagawa.nvim" },

  { "nyoom-engineering/nyoom.nvim" },

  {
    "uloco/bluloco.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
  },

  {
    "hwadii/gruber_darker.nvim",
    dependencies = { "rktjmp/lush.nvim" },
  },

  -- Configure LazyVim to load catppuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruber_darker",
    },
  },
}
