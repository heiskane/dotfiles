return {
    cmd = { "ruff", "server" },
    filetypes = { "python" },
    root_markers = {
        "pyproject.toml",
        "uv.lock",
        "poetry.lock",
        "setup.py",
        "requirements.txt",
        ".git",
    },
    settings = {
        init_options = {
            settings = {
                -- Server settings should go here
            },
        },
    },
}
