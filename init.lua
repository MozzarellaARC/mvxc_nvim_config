require("config.keymap")
require("config.lazy")

vim.api.nvim_create_augroup("FloatDiagnostics", { clear = true })

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = "FloatDiagnostics",
  callback = function()
    local opts = {
      focusable = false,
      scope = "cursor",
      max_width = 60,
      max_height = 7,
      close_events = { "CursorMoved", "InsertEnter", "BufLeave" },
    }

    -- Only show if there's a diagnostic under the cursor
    local line = vim.fn.line(".") - 1
    local col = vim.fn.col(".") - 1
    local diagnostics = vim.diagnostic.get(0, { lnum = line })

    for _, d in ipairs(diagnostics) do
      if d.col <= col and col <= d.end_col then
        vim.diagnostic.open_float(nil, opts)
        return
      end
    end
  end,
})

vim.o.updatetime = 100
