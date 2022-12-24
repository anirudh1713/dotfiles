local tokyonight_setup, tokyonight = pcall(require, "tokyonight")
if not tokyonight_setup then
	return
end

tokyonight.setup({
	transparent = true,
    styles = {
        sidebars = "transparent",
        floats = "transparent",
	},
})
