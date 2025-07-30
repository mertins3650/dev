require("luasnip.session.snippet_collection").clear_snippets("md")

local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("markdown", {
	s("cb", fmt("+ [{}] {}", { i(1), i(2) })),
})
