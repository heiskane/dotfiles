return {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    lazy = true,
    cmd = { "Telescope" },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-live-grep-args.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        "andrew-george/telescope-themes",
    },
    opts = {
        extensions = {
            ["ui-select"] = {
                function()
                    require("telescope.themes").get_dropdown({})
                end,
            },
            live_grep_args = {
                auto_quoting = true, -- enable/disable auto-quoting
                mappings = {
                    i = {
                        ["<C-k>"] = function()
                            require("telescope-live-grep-args.actions").quote_prompt()
                        end,
                        ["<C-i>"] = function()
                            require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob " })
                        end,
                        ["<C-Down>"] = function()
                            require("telescope.actions").cycle_history_next()
                        end,
                        ["<C-Up>"] = function()
                            require("telescope.actions").cycle_history_prev()
                        end,
                    },
                },
            },
        },
    },
    keys = {
        {
            "ff",
            function()
                require("telescope.builtin").find_files()
            end,
            mode = "n",
        },
        {
            "<leader>fg",
            function()
                require("telescope").extensions.live_grep_args.live_grep_args()
            end,
            mode = "n",
        },
    },
    config = function()
        local telescope = require("telescope")
        telescope.load_extension("ui-select")
        telescope.load_extension("live_grep_args")
        telescope.load_extension("themes")
    end,
}
