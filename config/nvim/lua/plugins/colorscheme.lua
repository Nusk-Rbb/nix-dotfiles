return {
  -- add color theme
  { "catppuccin/nvim", name = "catppuccin", priotiry = 1000 },

  { "Shatur/neovim-ayu" },

  { "olivercederborg/poimandres.nvim" },

  -- Configure LazyVim to load catppuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "poimandres",
    },
  },
}
