require("codecompanion").setup({
    adapters = {
        ollama = function()
            return require("codecompanion.adapters").extend("ollama", {
                schema = {
                    model = {
                        default = "deepseek-coder:latest",
                    },
                },
            })
        end,
    },
    strategies = {
        chat = {
            adapter = "ollama",
        },
        inline = {
            adapter = "ollama",
        },
    },
})
