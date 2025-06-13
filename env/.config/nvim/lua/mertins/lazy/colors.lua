-- local theme = "vague"
-- local theme = "tokyonight"
-- local theme = "rose-pine"
local theme = "catppuccin"

function ColorMyPencils(color)
	vim.cmd.colorscheme(color or theme)
end

local themes = {
	vague = {
		"vague2k/vague.nvim",
		name = "vague",
		lazy = false,
		priority = 1000,
		config = function()
			require("vague").setup({
				transparent = true,
				style = {
					strings = "none",
				},
			})
			ColorMyPencils()
		end,
	},
	tokyonight = {
		"folke/tokyonight.nvim",
		name = "tokyonight",
		lazy = false,
		priority = 1000,
		config = function()
			local bg = "#011628"
			local bg_dark = "#011423"
			local bg_highlight = "#143652"
			local bg_search = "#0A64AC"
			local bg_visual = "#275378"
			local fg = "#CBE0F0"
			local fg_dark = "#B4D0E9"
			local fg_gutter = "#627E97"
			local border = "#547998"
			require("tokyonight").setup({
				transparent = true,
				style = "night",
				on_colors = function(colors)
					colors.bg = bg
					colors.bg_dark = bg_dark
					colors.bg_float = bg_dark
					colors.bg_highlight = bg_highlight
					colors.bg_popup = bg_dark
					colors.bg_search = bg_search
					colors.bg_sidebar = bg_dark
					colors.bg_statusline = bg_dark
					colors.bg_visual = bg_visual
					colors.border = border
					colors.fg = fg
					colors.fg_dark = fg_dark
					colors.fg_float = fg
					colors.fg_gutter = fg_gutter
					colors.fg_sidebar = fg_dark
				end,
				styles = {
					keywords = { italic = false },
				},
			})
			ColorMyPencils()
		end,
	},
	["rose-pine"] = {
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "moon",
				styles = {
					transparency = true,
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
				flavor = "mocha",
				transparent_background = true,
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

-- Only return the active theme's plugin spec
return { themes[theme] }
