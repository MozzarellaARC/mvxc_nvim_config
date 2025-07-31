return {
  "zbirenbaum/copilot-cmp",
  dependencies = {
    "zbirenbaum/copilot.lua",
  },
  config = function()
    require("copilot_cmp").setup({
      -- Method for getting completions
      method = "getCompletionsCycling",
      -- Format the completion item
      formatters = {
        label = require("copilot_cmp.format").format_label_text,
        insert_text = require("copilot_cmp.format").format_insert_text,
        preview = require("copilot_cmp.format").deindent,
      },
    })
  end,
}
