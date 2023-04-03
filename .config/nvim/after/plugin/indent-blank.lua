local setup, indent_blank = pcall(require, "indent_blankline")
if not setup then
	return
end

indent_blank.setup({
	char = "┊",
	show_trailing_blankline_indent = false,
})
