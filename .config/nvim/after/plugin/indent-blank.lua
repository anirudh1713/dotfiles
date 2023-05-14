local setup, indent_blank = pcall(require, "indent_blankline")
if not setup then
	return
end

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

indent_blank.setup({
	char = "┊",
	-- show_trailing_blankline_indent = false,
  space_char_blankline = " ",
  show_end_of_line = true,
  -- show_current_context = true,
  -- show_current_context_start = true,
})
