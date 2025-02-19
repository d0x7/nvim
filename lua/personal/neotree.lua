vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        -- Check if an argument was provided, if not, open neotree in the current directory, otherwise in the provided directory
        -- Also check if the provided path is a file, and if so, use the base path, otherwise not
        --- local path = vim.fn.expand(vim.fn.argc() == 0 and vim.fn.getcwd() or vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.expand(vim.fn.argv(0))) == 0 and vim.>
        require('neo-tree.command').execute({ toggle = false, dir = vim.fn.getcwd() })
    end
})
return {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    event = "VeryLazy", -- Load automatically after startup optimizations
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
        'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
        { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    },
    opts = {
        filesystem = {
            window = {
                mappings = {
                    ['\\'] = 'close_window',
                },
            },
        },
    },
}



