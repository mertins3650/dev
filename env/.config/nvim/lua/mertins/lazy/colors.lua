local theme = "tokyonight"
-- local theme = "rose-pine"
-- local theme = "catppuccin"

function ColorMyPencils(color)
	vim.cmd.colorscheme(color or theme)
	vim.opt.winhighlight = "NormalNC:NormalFloat"
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

local themes = {
	tokyonight = {
		"folke/tokyonight.nvim",
		name = "tokyonight",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "night",
				styles = {
					keywords = { italic = false },
				},
			})
			ColorMyPencils()
		end,
	},
	["rose-pine"] = {
		"rose-pine/neovim",
		name = "rose-epine",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "moon",
				disable_background = true,
				styles = {
					italic = false,
				},
			})
			ColorMyPencils()
		end,
	},
	catppuccin = {
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
				flavor = "mocha",
				no_italic = false,
				styles = {
					conditionals = {},
					miscs = {},
					keywords = {},
				},
			})
			ColorMyPencils()
		end,
	},
}

return { themes[theme] }
