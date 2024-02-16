return {
	"stevearc/oil.nvim",
	lazy = false,
	opts = {
		view_options = {
			-- Show files and directories that start with "."
			show_hidden = true,
			-- This function defines what is considered a "hidden" file
			is_hidden_file = function(name, bufnr)
				return vim.startswith(name, ".")
			end,
			-- This function defines what will never be shown, even when `show_hidden` is set
			is_always_hidden = function(name, bufnr)
				return false
			end,
			sort = {
				-- sort order can be "asc" or "desc"
				-- see :help oil-columns to see which columns are sortable
				{ "type", "asc" },
				{ "name", "asc" },
			},
		},
	},
	keys = {
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
	},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
}

-- Failed to load `plugins.oil`
--
-- /Users/ailadir/.config/nvim/lua/plugins/oil.lua:25: attempt to call field 'est' (a nil value)
--
-- # stacktrace:
--   - lua/plugins/oil.lua:25
--   - lua/config/lazy.lua:9
--   - init.lua:2
