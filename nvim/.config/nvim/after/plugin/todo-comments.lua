require("todo-comments").setup({
    highlight = {pattern = {[[.*\@<(KEYWORDS)\s*]], [[.*<(KEYWORDS)\s*:]]}},
    search = {pattern = [[\b(KEYWORDS):|@\b(KEYWORDS)]]}
})
