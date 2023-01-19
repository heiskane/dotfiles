local dap = require('dap')
local dapui = require('dapui')
dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
    name = 'lldb'
}

dap.configurations.cpp = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/',
                                'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {}
    }
}

dap.configurations.rust = dap.configurations.cpp
dap.configurations.rust[1].program = function()
    local print_data = function(_, data)
        for _, line in pairs(data) do print(line) end
    end

    print("building...")
    vim.cmd.redraw()
    local build_job = vim.fn.jobstart({"cargo", "build"}, {
        stdout_buffered = true,
        on_stdout = print_data,
        on_stderr = print_data
    })
    vim.fn.jobwait({build_job})
    local dirs = vim.split(vim.fn.getcwd(), '/', {trimempty = true})
    return vim.fn.input('exec: ',
                        vim.fn.getcwd() .. '/target/debug/' .. dirs[#dirs],
                        'file')
end

dapui.setup({
    icons = {expanded = "▶", collapsed = "●", current_frame = "★"},
    layouts = {
        {
            elements = {
                -- Elements can be strings or table with id and size keys.
                "breakpoints", "scopes"
            },
            size = 55, -- 40 columns
            position = "left"
        }, {elements = {"repl"}, size = 0.33, position = "bottom"}
    },
    controls = {
        -- Requires Neovim nightly (or 0.8 when released)
        enabled = true,
        -- Display controls in this element
        element = "repl",
        icons = {
            pause = "⏸",
            play = "▶",
            step_into = "🡻",
            step_over = "🡹",
            step_out = "🡺",
            step_back = "🡸",
            run_last = "↺",
            terminate = "✖"
        }
    }
})

dap.listeners.after.event_initialized["dapui_config"] =
    function() dapui.open() end
