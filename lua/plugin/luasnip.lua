return {
  "L3MON4D3/LuaSnip",
  event = "UIEnter",
  config = function ()
    local ls = require("luasnip")
    -- some shorthands...
    local snip = ls.snippet
    local node = ls.snippet_node
    local text = ls.text_node
    local insert = ls.insert_node
    local func = ls.function_node
    local choice = ls.choice_node
    local dynamicn = ls.dynamic_node

    ls.add_snippets(nil, {
      all = {
        snip({
          trig = "/checklist",
          namr = "Checklist",
          dscr = "Cmd: Add checklist item",
        }, {
          ls.text_node("[ ] "),
        }),
        snip({
          trig = "/link",
          namr = "Link",
          dscr = "Cmd: Add link item",
        }, {
          -- [$1]($2)
          ls.text_node("["), ls.insert_node(1), ls.text_node("]"),
          ls.text_node("("), ls.insert_node(2), ls.text_node(")")
        }),
        snip({
          trig = "/http",
          namr = "Url",
          dscr = "Cmd: Add url item",
        }, {
          -- https://
          ls.text_node("https://")
        }),
        snip({
          trig = "**",
          wordTrig = false,
          namr = "Bold",
          dscr = "Cmd: Add Bold item",
        }, {
          -- **$1**
          ls.text_node("**"), ls.insert_node(1), ls.text_node("**")
        })
      },
    })
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
  dependencies = {
    "rafamadriz/friendly-snippets"
  }
}
