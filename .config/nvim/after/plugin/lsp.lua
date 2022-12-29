local setup_lsp, lsp = pcall(require, "lsp-zero")
if not setup_lsp then
	return
end

local null_ls_setup, null_ls = pcall(require, "null-ls")
if not null_ls_setup then
	return
end

local rust_tools_setup, rust_tools = pcall(require, "rust-tools")
if not rust_tools_setup then
	return
end

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"html",
	"cssls",
	"tailwindcss",
	"dockerls",
	"graphql",
	"jsonls",
	"jdtls",
	"marksman",
	"sqlls",
	"eslint",
	"yamlls",
	"sumneko_lua",
})

local function on_attach(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
	vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end

lsp.on_attach(on_attach)

-- rust setup
rust_tools.setup({
	server = {
		on_attach = on_attach,
		settings = {
			-- to enable rust-analyzer settings visit:
			-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
			["rust-analyzer"] = {
				-- enable clippy on save
				checkOnSave = {
					command = "clippy",
				},
			},
		},
	},
})
-- end rust setup

lsp.configure("sumneko_lua", {
	on_attach = on_attach,
	settings = {
		Lua = {
			completion = {
				enable = true,
				showWord = "Disable",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = { os.getenv("VIMRUNTIME") },
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

lsp.setup()

-- null-ls setup for formatting and diagnostics
local null_opts = lsp.build_options("null-ls", {})

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
local code_actions = null_ls.builtins.code_actions

-- to setup format on save
local fmt_group = vim.api.nvim_create_augroup("FORMATTING", { clear = true })

null_ls.setup({
	sources = {
		formatting.prettier,
		formatting.stylua,
		formatting.rustfmt,
		diagnostics.eslint_d,
		code_actions.eslint_d,
		completion.spell,
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		null_opts.on_attach(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = fmt_group,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						timeout_ms = 3000,
						buffer = bufnr,
					})
				end,
			})
		end
	end,
})

vim.diagnostic.config({
	virtual_text = {
		source = "always",
	},
	float = {
		source = "always",
	},
})
