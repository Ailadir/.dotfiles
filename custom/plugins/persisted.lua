return {
	"olimorris/persisted.nvim",
	config = true,
	config = function()
		require("persisted").setup({
			use_git_branch = true,
			autoload = true,
			on_autoload_no_session = function()
				vim.notify("No existing session to load.")
			end,
		})
	end,
}
