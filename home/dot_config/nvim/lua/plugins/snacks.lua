-- Pas de `event` ni de `config` ici : LazyVim spec snacks en lazy=false/priority=1000
-- (nécessaire pour que le dashboard s'affiche au démarrage). On se contente de
-- fusionner des opts. La transparence est gérée dans ui.lua, pas ici.
--
-- Les keymaps LazyVim par défaut (bd, gg, gb, gf, gl, gB, cR, un, <c-/>, ]]/[[)
-- ne sont pas redéclarés : ils viennent de lazyvim/config/keymaps.lua.
return {
  "folke/snacks.nvim",
  -- Zen reste ponctuel sur <leader>z. Essayé en auto-activation par défaut, retiré :
  -- le zen de snacks est un flottant par-dessus la fenêtre parente, donc chaque
  -- fichier ouvrait 2 fenêtres pour 1 buffer → double `:q`, et splits/`:only`/
  -- comptage de fenêtres cassés. Le zen n'est pas conçu pour être toujours-actif.
  opts = {
    -- Sidebar file explorer désactivée volontairement (oil.nvim la remplace, cf. editor.lua)
    explorer = { enabled = false },
    notifier = { level = vim.log.levels.TRACE },
    statuscolumn = { enabled = false },
  },
  keys = {
    { "<leader>z", function() require("snacks").zen() end, desc = "Zen Mode" },
    { "<leader>Z", function() require("snacks").zen.zoom() end, desc = "Zen Zoom" },
    -- Explorer sidebar désactivée : on libère ses keymaps LazyVim.
    { "<leader>e", false },
    { "<leader>E", false },
    { "<leader>fe", false },
    { "<leader>fE", false },
  },
}
