return {
    {
        "nvim-treesitter/nvim-treesitter", 
        branch = 'main', 
        lazy = false, 
        build = ":TSUpdate",
        config = function()
            local configs = require 'nvim-treesitter'
            configs.setup({
                ensure_installed = { "c", "cpp", "lua", "markdown", "markdown_inline", "latex" },
            })
        end
    }
}
