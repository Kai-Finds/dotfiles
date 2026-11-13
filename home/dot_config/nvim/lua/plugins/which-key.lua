-- Uniquement les écarts par rapport aux défauts de which-key (icônes, presets,
-- replace, triggers, show_* sont déjà ceux-là par défaut).
--
-- Pas de `spec` ici : LazyVim déclare opts_extend = { "spec" }, donc toute
-- entrée s'AJOUTE à la sienne au lieu de la remplacer. which-key dérive les
-- groupes des keymaps qui ont un `desc`.
return {
  "folke/which-key.nvim",
  opts = {
    preset = "modern",
    win = {
      border = "rounded",
      wo = { winblend = 0 }, -- cohérent avec options.lua / floats transparents
    },
    sort = { "local", "order", "group", "alphanum", "mod" },
  },
}
