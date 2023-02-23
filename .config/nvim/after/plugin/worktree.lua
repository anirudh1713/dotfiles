local worktree_setup, worktree = pcall(require, "git-worktree")
if not worktree_setup then
  return
end

local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  return
end

local plenary_setup, Job = pcall(require, "plenary.job")
if not plenary_setup then
  return
end

worktree.setup();

telescope.load_extension("git_worktree")
vim.keymap.set("n", "<leader>gw", telescope.extensions.git_worktree.git_worktrees)
vim.keymap.set("n", "<leader>cgw", telescope.extensions.git_worktree.create_git_worktree)

worktree.on_tree_change(function(op, metadata)
  -- @TODO cehck if in correct project to run @TODO cehck if in correct project to run.
  if op == worktree.Operations.Switch then
    Job:new({
      command = 'yarn',
      -- args = { '--files' },
      -- cwd = '/usr/bin',
      -- env = { ['a'] = 'b' },
      on_exit = function(j, return_val)
        print(return_val)
        print(j:result())
      end
    }):start()
  end
end)
