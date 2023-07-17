local telescope_actions = require "telescope.actions"
local nvimtree = require "custom.configs.overrides.nvimtree"

local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- bash stuff
    "bash",
  },
}

-- git support in nvimtree
M.nvimtree = nvimtree

M.telescope = {
  defaults = {
    mappings = {
      i = {
        ["<C-n>"] = telescope_actions.cycle_history_next,
        ["<C-p>"] = telescope_actions.cycle_history_prev,
        ["<C-j>"] = telescope_actions.move_selection_next,
        ["<C-k>"] = telescope_actions.move_selection_previous,
      },
      n = { q = telescope_actions.close },
    },
  },
}

M.whichkey = {
  opts = {
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "󰉗 ", -- symbol prepended to a group
    },
  },
  init = function()
    local wk = require "which-key"

    wk.register {
      ["<leader>f"] = { name = "Find" },
      ["<leader>l"] = { name = "Lsp" },
      ["<leader>p"] = { name = "Packages" },
      ["<leader>g"] = { name = "Git" },
      ["<leader>w"] = { name = "Workspace" },
      ["<leader>t"] = { name = "Terminal" },
    }
  end,
}

return M
