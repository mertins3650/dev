-- local theme = "tokyonight"
local theme = "catppuccin"

function ColorMyPencils(color)
	vim.cmd.colorscheme(color or theme)
end

local themes = {
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
	catppuccin = {
		"catppuccin/nvim",
		name = "catppuccin",
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

			require("catppuccin").setup({
				flavor = "mocha",
				no_italic = false,
				styles = {
					conditionals = {},
					miscs = {},
					keywords = {},
				},
				custom_highlights = function(_)
					return {
						Normal = { bg = bg, fg = fg },
						NormalNC = { bg = bg_dark, fg = fg_dark },
						NormalFloat = { bg = bg_dark, fg = fg },
						FloatBorder = { bg = bg_dark, fg = border },
						FloatTitle = { bg = bg_dark, fg = border },
						Pmenu = { bg = bg_dark, fg = fg },
						PmenuSel = { bg = bg_highlight, fg = fg },
						PmenuSbar = { bg = bg_dark },
						PmenuThumb = { bg = bg_highlight },
						Visual = { bg = bg_visual },
						Search = { bg = bg_search, fg = fg },
						LineNr = { fg = fg_gutter, bg = bg_dark },
						SignColumn = { bg = bg_dark },
						StatusLine = { bg = bg_dark, fg = fg },
						WinSeparator = { fg = border, bg = bg_dark },
						VertSplit = { fg = border, bg = bg_dark },
					}
				end,
			})
			ColorMyPencils()
		end,
	},
}

return { themes[theme] }
