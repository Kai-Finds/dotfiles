-- Colorscheme + transparence.
--
-- La transparence se règle via les options natives du colorscheme : il connaît ses
-- propres groupes de highlight, donc pas de liste à maintenir à la main ni d'autocmd.
-- (La v1 l'implémentait 4 fois, dont 3 sur VimEnter — qui ne tire qu'une fois et se
-- fait écraser au premier :colorscheme.)
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
      -- transparent_background ne couvre que Normal/NormalNC. Les fenêtres flottantes
      -- ont leur propre option, et elle exige winblend == 0 (cf. config/options.lua) :
      --   NormalFloat = { bg = (O.float.transparent and vim.o.winblend == 0) and C.none or C.mantle }
      float = { transparent = true, solid = false },
    },
  },

  -- Gardé transparent pour pouvoir switcher à la volée sans rien casser.
  {
    "folke/tokyonight.nvim",
    optional = true,
    opts = {
      transparent = true,
      styles = { sidebars = "transparent", floats = "transparent" },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "catppuccin-mocha" },
  },

  -- Statusline masquée. lualine force laststatus=3 à chaque refresh
  -- (lualine.lua:539), donc laststatus=0 seul ne tiendrait pas : il faut le
  -- désactiver. La barre elle-même est retirée via laststatus=0 (config/options.lua).
  { "nvim-lualine/lualine.nvim", enabled = false },
}
