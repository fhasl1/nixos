return {
    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
        keys = {
            { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
            { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics" },
            { "<leader>xs", "<cmd>Trouble symbols toggle<cr>", desc = "Symbols" },
            { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location List" },
            { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List" },
        },
    },
}
