local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

return {
  s(
    { trig = 'ns', name = 'new snippet', dscr = 'A LaTeX equation environment', snippetType = 'snippet' },
    fmt( -- The snippet code actually looks like the equation environment it produces.
      [[
s({trig = "<>", name = "<>", dscr = "<>", snippetType = "snippet"},
fmta(<>)
)
]],
      -- The insert node is placed in the <> angle brackets
      { i(1), i(2), i(3), i(4) },
      -- This is where I specify that angle brackets are used as node positions.
      { delimiters = '<>' }
    )
  ),
}
