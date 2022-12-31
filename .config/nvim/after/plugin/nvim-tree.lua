local setup, tree = pcall(require, "nvim-tree")
if not setup then
  return
end

tree.setup({
  view = {
    side = "right",
  },
})

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
