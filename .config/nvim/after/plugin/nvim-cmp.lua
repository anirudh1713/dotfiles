local setup_cmp, cmp = pcall(require, "cmp")
if not setup_cmp then
	return
end

local setup_luasnip, luasnip = pcall(require, "luasnip")
if not setup_luasnip then
	return
end

local setup_lspkind, lspkind = pcall(require, "lspkind")
if not setup_lspkind then
	return
end

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			menu = {
				buffer = "[buf]",
				nvim_lsp = "[LSP]",
				path = "[path]",
				luasnip = "[snip]",
			},
		}),
	},

	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),

	sources = {
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "luasnip" },
		{ name = "buffer", Keyword_length = 5 },
	},

	experimental = {
		ghost_text = true,
	},
})
