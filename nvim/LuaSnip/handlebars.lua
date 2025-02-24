-- filename matched filetype
local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
return {
	-- if block
  s(
    { trig = '{{if' },
		fmt(
			[[
				{{#if <>}}
				{{/if}}
			]],
			{ i(1) },
			{ delimiters = '<>' }
		)
  ),
	-- with block
  s(
    { trig = '{{with' },
		fmt(
			[[
				{{#with <>}}
				{{/with}}
			]],
			{ i(1) },
			{ delimiters = '<>' }
		)
  ),
	-- else
	s(
		{ trig = '{{el' },
		{ t('{{else}}') }
  ),
	-- each block
  s(
    { trig = '{{each' },
		fmt(
			[[
				{{#each <>}}
				{{/each}}
			]],
			{ i(1) },
			{ delimiters = '<>' }
		)
  ),
	-- inline partial block
  s(
    { trig = '{{inline' },
		fmt(
			[[
				{{#*inline "<>"}}
				{{/inline}}
			]],
			{ i(1) },
			{ delimiters = '<>' }
		)
  ),
}
