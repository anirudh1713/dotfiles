function ColorNvim(color)
  -- vim.cmd([[
  --   let g:everforest_transparent_background=1
  -- ]])

  vim.cmd([[
    let g:gruvbox_bold=0
  ]])

  vim.cmd([[
    let g:gruvbox_italic=0
  ]])

  color = color or "tokyonight"
  vim.cmd.colorscheme(color)

  -- vim.g.PaperColor_Theme_Options = {
  --   theme = {
  --     default = {
  --       allow_bold = 0
  --     }
  --   }
  -- } 


  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  -- -- vim.api.nvim_set_hl(0, "Comment", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "Special", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "Identifier", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "CursorLinNr", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "Structure", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "Operator", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "Repeat", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "Conditional", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "Function", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "String", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "Todo", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "Underlined", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none" })

  -- -- transparent background
  -- vim.cmd("hi Normal guibg=none ctermbg=none")
  -- vim.cmd("hi LineNr guibg=none ctermbg=none")
  -- vim.cmd("hi Folded guibg=none ctermbg=none")
  -- vim.cmd("hi NonText guibg=none ctermbg=none")
  -- vim.cmd("hi SpecialKey guibg=none ctermbg=none")
  -- vim.cmd("hi VertSplit guibg=none ctermbg=none")
  -- vim.cmd("hi SignColumn guibg=none ctermbg=none")
  -- vim.cmd("hi EndOfBuffer guibg=none ctermbg=none")
end

ColorNvim("kanagawa")
