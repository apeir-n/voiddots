vim.notify = require("notify")

require("notify").setup({
    stages = "slide",
    background_colour = "none",
    fps = 60,
    timeout = 1000,
    render = "default",
})
