return {
    {
        "nvim-tree/nvim-tree.lua",
        lazy=false,
        priority = 999,
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("nvim-tree").setup()
        end,
    }
}    
