return {
  -- Explorateur en buffer : renommer/déplacer/supprimer avec dd, cw, p puis :w.
  -- Pas de sidebar (snacks.explorer reste désactivé, cf. snacks.lua).
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Oil (répertoire parent)" },
    },
    opts = {
      view_options = { show_hidden = true },
    },
  },

  -- grug-far : fourni par LazyVim core sur <leader>sr, rien à redéclarer.

  -- Rend les diffs de lazy-lock.json lisibles.
  { "willothy/lockfile.nvim", opts = {} },
}
