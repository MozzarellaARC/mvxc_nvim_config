return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    -- Snippet engine
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    
    -- LSP source
    "hrsh7th/cmp-nvim-lsp",
    
    -- Buffer source
    "hrsh7th/cmp-buffer",
    
    -- Path source
    "hrsh7th/cmp-path",
    
    -- Command line source
    "hrsh7th/cmp-cmdline",
    
    -- Snippet collection
    "rafamadriz/friendly-snippets",
    
    -- Copilot integration
    "zbirenbaum/copilot-cmp",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    
    -- Custom highlight for CMP windows
    vim.api.nvim_set_hl(0, "CmpPmenu",       { bg = "#1e1e2e", fg = "#cdd6f4" })  -- Completion menu
    vim.api.nvim_set_hl(0, "CmpSel",         { bg = "#45475a", fg = "#f5c2e7" })  -- Selected item
    vim.api.nvim_set_hl(0, "CmpDoc",         { bg = "#1e1e2e", fg = "#cdd6f4" })  -- Documentation
    vim.api.nvim_set_hl(0, "CmpGhostText",   { fg = "#6c7086", italic = true })   -- Ghost text


    -- Load snippets from friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()
    
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      
      -- Preselect first item like VSCode
      preselect = cmp.PreselectMode.Item,
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      
      mapping = cmp.mapping.preset.insert({
        -- Navigate through completions
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        
        -- Scroll through docs
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        
        -- Open completion menu
        ["<C-Space>"] = cmp.mapping.complete(),
        
        -- Close completion menu
        ["<C-e>"] = cmp.mapping.abort(),
        
        -- Accept completion
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        
        -- Tab completion like VSCode - accepts first item or expands snippet
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = true })
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      
      sources = cmp.config.sources({
        { name = "copilot", group_index = 2 },
        { name = "nvim_lsp", group_index = 2 },
        { name = "luasnip", group_index = 2 },
        { name = "buffer", group_index = 2 },
        { name = "path", group_index = 2 },
      }),
      
      formatting = {
        format = function(entry, vim_item)
          -- Add source name to completion items
          vim_item.menu = ({
            copilot = "[Copilot]",
            nvim_lsp = "[LSP]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            path = "[Path]",
          })[entry.source.name]
          
          return vim_item
        end,
      },
      
      window = {
        completion = {
          border = "none",
          winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
          scrollbar = false,
          col_offset = -3,
          side_padding = 0,
          max_height = 10, -- Limit to 10 items visible at once
        },
        documentation = {
          border = "none",
          winhighlight = "Normal:CmpDoc",
          max_width = 80,
          max_height = 20,
        },
      },
      
      experimental = {
        ghost_text = {
          hl_group = "CmpGhostText",
        },
      },
    })
  end,
}