return {
	"olimorris/persisted.nvim",
	lazy = false,
	config = function()
		require("telescope").load_extension("persisted")
		require("persisted").setup({
			use_git_branch = true,
			autoload = true,
			should_autosave = function()
				if vim.bo.filetype == "alpha" then
					return false
				end
				return true
			end,
			on_autoload_no_session = function()
				vim.notify("No existing session to load.")
			end,
		})
	end,
	priority = 1000,
}
