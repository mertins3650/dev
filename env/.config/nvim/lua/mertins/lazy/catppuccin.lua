return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
				no_italic = false,
				styles = {
					conditionals = {},
					miscs = {},
					keywords = {},
				},
			})
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
}
