return {
    "R-nvim/R.nvim",
    lazy = false,
    ft = { "r" },
    config = function()
        require("r").setup({
            rconsole_width = 0,
            disable_cmds = {
                "RSendFunction",
                "RESendFunction",
                "RDSendFunction",
                "RSendMBlock",
                "RESendMBlock",
                "RDSendMBlock",
                "REDSendMBlock",
            },
        })
    end,
}
