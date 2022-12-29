require("tokyonight")
require("catppuccin")

function ColorNvim(color)
	color = color or "tokyonight"
	vim.cmd.colorscheme(color)

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	--
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

ColorNvim("catppuccin")
