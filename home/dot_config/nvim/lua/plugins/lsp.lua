-- Réglages serveurs propres à cette config, fusionnés dans la couche LSP de LazyVim.
--
-- Ne PAS réimplémenter ici : keymaps LSP (défauts core 0.12 + LazyVim avec
-- capability-gating), diagnostics/icônes, inlay hints, format-on-save (conform.nvim),
-- ni mason/mason-lspconfig (LazyVim pilote le pipeline). Un `config = function()`
-- remplacerait cette couche au lieu de la fusionner — c'est ce qui rendait la v1 morte.
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            hint = { enable = true },
            format = { enable = true },
            diagnostics = { disable = { "missing-fields" } },
            -- workspace.library : géré par lazydev.nvim, ne pas le refaire à la main.
          },
        },
      },

      pyright = {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              diagnosticMode = "openFilesOnly",
            },
          },
        },
      },

      -- L'extra lang.go configure déjà gofumpt, staticcheck, hints, usePlaceholders,
      -- completeUnimported et les analyses. Seul `shadow` est un ajout.
      gopls = {
        settings = { gopls = { analyses = { shadow = true } } },
      },

      -- yamlls : rien ici. L'extra lang.yaml injecte tout SchemaStore via un hook
      -- before_init, ce qui couvre déjà github-workflow, docker-compose et
      -- kustomization — les 3 schémas que la v1 déclarait à la main (redondance
      -- confirmée : schema-companion rapportait 2 schémas correspondants).
      -- La détection k8s/CRD est câblée dans devops.lua.

      -- helm_ls : l'extra lang.helm câble helm-ls.nvim, qui route templates/*.yaml
      -- vers helm-ls et values.yaml vers yamlls. Aucun root_dir maison nécessaire.
    },
  },
}
