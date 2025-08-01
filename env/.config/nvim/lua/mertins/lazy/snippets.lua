local ls = require("luasnip")

vim.snippet.expand = ls.lsp_expand

---@diagnostic disable-next-line: duplicate-set-field
vim.snippet.active = function(filter)
	filter = filter or {}
	filter.direction = filter.direction or 1

	if filter.direction == 1 then
		return ls.expand_or_jumpable()
	else
		return ls.jumpable(filter.direction)
	end
end

---@diagnostic disable-next-line: duplicate-set-field
vim.snippet.jump = function(direction)
	if direction == 1 then
		if ls.expandable() then
			return ls.expand_or_jump()
		else
			return ls.jumpable(1) and ls.jump(1)
		end
	else
		return ls.jumpable(-1) and ls.jump(-1)
	end
end

vim.snippet.stop = ls.unlink_current

-- ================================================
--      My Configuration
-- ================================================
ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	override_builtin = true,
})

for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/mertins/snippets/*.lua", true)) do
	loadfile(ft_path)()
end

vim.keymap.set({ "i", "s" }, "<c-l>", function()
	return vim.snippet.active({ direction = 1 }) and vim.snippet.jump(1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-h>", function()
	return vim.snippet.active({ direction = -1 }) and vim.snippet.jump(-1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-j>", function()
	return require("luasnip").change_choice(1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-k>", function()
	return require("luasnip").change_choice(-1)
end, { silent = true })

vim.keymap.set("n", "<leader>ls", function()
	for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/mertins/snippets/*.lua", true)) do
		dofile(ft_path)
	end
	print("Snippets reloaded!")
end, { desc = "Reload LuaSnip snippets" })

return {}
