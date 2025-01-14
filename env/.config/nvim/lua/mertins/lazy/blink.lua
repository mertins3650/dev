return {
	"saghen/blink.cmp",
	version = "*",
	dependencies = "rafamadriz/friendly-snippets",
	opts = {
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		completion = {
			menu = {
				draw = {
					columns = { { "label", "label_description", gap = 1 }, { "kind" } },
				},
			},
		},
		signature = { enabled = true },
	},
	opts_extend = { "sources.default" },
}
