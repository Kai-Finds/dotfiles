-- Couche DevOps : k8s, HTTP, CI.
-- Les LSP (terraformls, ansiblels, helm_ls, dockerls, yamlls...) viennent des lang
-- extras LazyVim — rien à câbler ici.

-- État partagé entre le lanceur k9s et les hooks flatten : quand k9s ouvre un
-- éditeur, la float doit s'effacer le temps de l'édition, puis revenir.
local k9s_win
local k9s_hidden = false

return {
  -- Kubernetes : k9s dans le terminal snacks, pas de plugin.
  --
  -- kubectl.nvim a été essayé puis retiré : son informer v2 exige un binaire Rust
  -- que blink.download ne peut pas récupérer (la release ne publie aucun asset), et
  -- le repli `build = 'make build'` réclame une toolchain Rust nightly absente d'ici.
  -- Il chargeait sans jamais rien afficher. k9s est déjà installé et fait le travail.
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>k",
        function()
          k9s_win = require("snacks").terminal("k9s", {
            env = {
              -- `e` dans k9s lance $KUBE_EDITOR. Sans rien, ce serait un nvim
              -- imbriqué dans le nvim. flatten.nvim intercepte et renvoie le
              -- fichier vers cette instance-ci ; `g:flatten_wait` force l'invité
              -- à bloquer jusqu'à fermeture du buffer (flatten/guest.lua:36) —
              -- sans quoi k9s croirait l'édition finie et la jetterait.
              KUBE_EDITOR = "nvim --cmd 'let g:flatten_wait=1'",
            },
            win = {
              position = "float",
              width = 0.9, -- k9s est un TUI plein écran, il lui faut de la place
              height = 0.9,
              border = "rounded",
              title = " k9s ",
              title_pos = "center",
            },
          })
        end,
        desc = "k9s (Kubernetes)",
      },
    },
  },

  -- Ouvre les fichiers des nvim imbriqués (k9s `e`, commits lazygit, kubectl edit…)
  -- dans CETTE instance au lieu d'en démarrer une dans le terminal.
  -- Détecte l'hôte via $NVIM, que nvim expose dans ses terminaux (flatten/init.lua:241).
  {
    "willothy/flatten.nvim",
    lazy = false,
    priority = 1001, -- avant tout ce qui pourrait ouvrir un buffer
    opts = {
      -- Sans ça (défaut "current"), le fichier remplacerait k9s dans la float.
      window = { open = "alternate" },
      hooks = {
        post_open = function(ctx)
          if ctx.is_blocking and k9s_win and k9s_win:win_valid() then
            k9s_win:hide()
            k9s_hidden = true
          end
        end,
        -- Ne restaure que si on a bien masqué : block_end tire aussi sur les
        -- commits git, où il n'y a pas de float k9s à remettre.
        block_end = function()
          if k9s_hidden and k9s_win then
            k9s_win:show()
            k9s_hidden = false
          end
        end,
      },
    },
  },

  -- Client HTTP/GraphQL/gRPC : fichiers .http (spec JetBrains).
  {
    "mistweaverco/kulala.nvim",
    ft = { "http", "rest" },
    keys = {
      { "<leader>R", "", desc = "+rest", ft = "http" },
      { "<leader>Rs", function() require("kulala").run() end, desc = "Send request", ft = "http" },
      { "<leader>Ra", function() require("kulala").run_all() end, desc = "Send all requests", ft = "http" },
      { "<leader>Rb", function() require("kulala").scratchpad() end, desc = "Scratchpad", ft = "http" },
    },
    opts = {},
  },

  -- Détection de schémas YAML (k8s + CRD). Remplaçant de yaml-companion (archivé).
  -- Lit apiVersion/kind du buffer et résout le schéma, y compris les CRD via le
  -- catalogue datreeio/CRDs-catalog.
  { "cenk1cenk2/schema-companion.nvim", dependencies = { "nvim-lua/plenary.nvim" }, opts = {} },

  -- Enveloppe yamlls avec schema-companion.
  --
  -- `setup_client` est CONÇU pour envelopper une config existante : il fusionne
  -- `capabilities`, chaîne `on_attach`/`on_init` via add_hook_after, et ne touche
  -- ni `before_init` ni `settings` (vérifié dans adapters/yamlls.lua:9-45).
  -- Or LazyVim n'utilise sur yamlls que ces trois champs-là — d'où zéro conflit,
  -- et pas besoin d'un after/lsp/yamlls.lua qui se battrait avec vim.lsp.config().
  {
    "neovim/nvim-lspconfig",
    dependencies = { "cenk1cenk2/schema-companion.nvim" },
    opts = function(_, opts)
      local sc = require("schema-companion")
      opts.servers = opts.servers or {}
      opts.servers.yamlls = sc.setup_client(
        sc.adapters.yamlls.setup({
          sources = {
            sc.sources.matchers.kubernetes.setup({ version = "master" }),
            sc.sources.lsp.setup(),
          },
        }),
        opts.servers.yamlls or {}
      )
    end,
  },

  -- GitHub Actions n'a pas de language server : actionlint via nvim-lint.
  -- (yamlls couvre la validation structurelle via les schémas, cf. lsp.lua)
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        ["yaml.github"] = { "actionlint" },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    optional = true,
    opts = { ensure_installed = { "actionlint" } },
  },
}
