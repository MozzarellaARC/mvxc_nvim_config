return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  opts = {
    indent = {
      char = "┊",  -- Dotted vertical line (centered)
      tab_char = "│",
    },
    scope = {
      enabled = true,
      show_start = true,
      show_end = false,
      injected_languages = false,
      highlight = { "Function", "Label" },
      priority = 500,
    },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
    },
  },
}