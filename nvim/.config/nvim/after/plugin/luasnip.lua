-- if vim.g.snippets ~= "luasnip" then return end
local ls = require("luasnip")
local types = require("luasnip.util.types")

require("luasnip.loaders.from_vscode").lazy_load()

ls.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
    ext_opts = {
        [types.choiceNode] = {active = {virt_text = {{"<-", "Error?"}}}}
    }
}

-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
vim.keymap.set({"i", "s"}, "<C-k>", function()
    if ls.expand_or_jumpable() then ls.expand_or_jump() end
end, {silent = true, remap = true})

-- <c-j> is my jump backwards key.
-- this always moves to the previous item within the snippet
vim.keymap.set({"i", "s"}, "<c-j>",
               function() if ls.jumpable(-1) then ls.jump(-1) end end,
               {silent = true, remap = true})

-- <c-l> is selecting within a list of options.
-- This is useful for choice nodes (introduced in the forthcoming episode 2)
vim.keymap.set("i", "<c-l>", function()
    if ls.choice_active() then ls.change_choice(1) end
end)
