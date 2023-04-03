local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = true,
	sources = {
		formatting.prettierd.with({}),
		diagnostics.eslint_d.with({
			diagnostics_format = "[#{c}] #{m}",
		}),
		code_actions.eslint_d,
		formatting.stylua,
		code_actions.cspell,
		diagnostics.cspell.with({
			diagnostics_postprocess = function(diagnostic)
				diagnostic.severity = vim.diagnostic.severity["WARN"]
			end,
		}),
	},
})
