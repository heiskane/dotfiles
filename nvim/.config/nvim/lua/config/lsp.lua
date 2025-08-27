local enabled_servers = {
    "luals",
    "elixirls",
    "pyright",
    "ruff",
    "eslint",
    "postgresql",
    "angularls",
}

vim.lsp.enable(enabled_servers)
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = true,
})

--- Helper commands from nvim-lspconfig
--- https://github.com/neovim/nvim-lspconfig/blob/master/plugin/lspconfig.lua

-- Called from plugin/lspconfig.vim because it requires knowing that the last
-- script in scriptnames to be executed is lspconfig.
vim.api.nvim_create_user_command("LspInfo", ":checkhealth vim.lsp", { desc = "Alias to `:checkhealth vim.lsp`" })

vim.api.nvim_create_user_command("LspLog", function()
    vim.cmd(string.format("tabnew %s", vim.lsp.log.get_filename()))
end, {
    desc = "Opens the Nvim LSP client log.",
})

local complete_client = function(arg)
    return vim.iter(vim.lsp.get_clients())
        :map(function(client)
            return client.name
        end)
        :filter(function(name)
            return name:sub(1, #arg) == arg
        end)
        :totable()
end

local complete_config = function(arg)
    return enabled_servers
end

vim.api.nvim_create_user_command("LspStart", function(info)
    local servers = info.fargs

    -- Default to enabling all servers matching the filetype of the current buffer.
    -- This assumes that they've been explicitly configured through `vim.lsp.config`,
    -- otherwise they won't be present in the private `vim.lsp.config._configs` table.
    if #servers == 0 then
        local filetype = vim.bo.filetype
        for _, name in pairs(enabled_servers) do
            local filetypes = vim.lsp.config[name].filetypes
            if filetypes and vim.tbl_contains(filetypes, filetype) then
                table.insert(servers, name)
            end
        end
    end

    vim.lsp.enable(servers)
end, {
    desc = "Enable and launch a language server",
    nargs = "?",
    complete = complete_config,
})

vim.api.nvim_create_user_command("LspRestart", function(info)
    local clients = info.fargs

    -- Default to restarting all active servers
    if #clients == 0 then
        clients = vim.iter(vim.lsp.get_clients())
            :map(function(client)
                return client.name
            end)
            :totable()
    end

    for _, name in ipairs(clients) do
        if vim.lsp.config[name] == nil then
            vim.notify(("Invalid server name '%s'"):format(name))
        else
            vim.lsp.enable(name, false)
        end
    end

    local timer = assert(vim.uv.new_timer())
    timer:start(500, 0, function()
        for _, name in ipairs(clients) do
            vim.schedule_wrap(function(x)
                vim.lsp.enable(x)
            end)(name)
        end
    end)
end, {
    desc = "Restart the given client",
    nargs = "?",
    complete = complete_client,
})

vim.api.nvim_create_user_command("LspStop", function(info)
    local clients = info.fargs

    -- Default to disabling all servers on current buffer
    if #clients == 0 then
        clients = vim.iter(vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() }))
            :map(function(client)
                return client.name
            end)
            :totable()
    end

    for _, name in ipairs(clients) do
        if vim.lsp.config[name] == nil then
            vim.notify(("Invalid server name '%s'"):format(name))
        else
            vim.lsp.enable(name, false)
        end
    end
end, {
    desc = "Disable and stop the given client",
    nargs = "?",
    complete = complete_client,
})
