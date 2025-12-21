return {
	"CopilotC-Nvim/CopilotChat.nvim",
	dependencies = {
		"gptlang/lua-tiktoken",
		{ "nvim-lua/plenary.nvim", branch = "master" },
	},
	build = "make tiktoken",
	lazy = false,
	opts = {},
}
