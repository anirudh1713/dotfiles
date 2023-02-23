local setup, tree = pcall(require, "nvim-tree")
if not setup then
  return
end

tree.setup({
  view = {
    side = "right",
  },
  update_focused_file = {
    enable = true,
    update_root = true,
    ignore_list = {},
  },
  git = {
    enable = true,
    ignore = false,
    show_on_dirs = true,
    show_on_open_dirs = true,
    timeout = 400,
  },
})

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
