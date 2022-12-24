local setup, builtin = pcall(require, "telescope.builtin")
if not setup then
    return
end

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
vim.keymap.set("n", "<leader>fs", builtin.live_grep, {}) -- find string in current working directory as you type
vim.keymap.set("n", "<leader>fc", builtin.grep_string, {}) -- find string under cursor in current working directory
