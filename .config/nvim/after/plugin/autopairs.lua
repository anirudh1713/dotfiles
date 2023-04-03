local setup_autopairs, autopairs = pcall(require, "nvim-autopairs")
if not setup_autopairs then
	return
end

local setup_ts_autotag, ts_autotag = pcall(require, "nvim-ts-autotag")
if not setup_ts_autotag then
	return
end

autopairs.setup()
ts_autotag.setup()
