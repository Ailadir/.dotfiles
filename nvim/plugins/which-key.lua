return { -- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	event = "VeryLazy", -- Sets the loading event to 'VimEnter'
	-- opts={},
	keys = {
		{ "<leader>s", group = "[S]earch" },
		{ "<leader>s_", hidden = true },
	},
	config = function() -- This is the function that runs, AFTER loading
		require("which-key").setup()

		-- Document existing key chains
		require("which-key").register({
			["<leader>c"] = {
				_ = "which_key_ignore",
				group = "[C]ode",
			},
			["<leader>d"] = {
				_ = "which_key_ignore",
				name = "[D]ocument",
			},
			["<leader>r"] = {
				_ = "which_key_ignore",
				name = "[R]ename",
			},
			["<leader>w"] = {
				_ = "which_key_ignore",
				name = "[W]orkspace",
			},
		})
	end,
}

-- {
--   ["<leader>c"] = {
--     _ = "which_key_ignore",
--     name = "[C]ode"
--   },
--   ["<leader>d"] = {
--     _ = "which_key_ignore",
--     name = "[D]ocument"
--   },
--   ["<leader>r"] = {
--     _ = "which_key_ignore",
--     name = "[R]ename"
--   },
--   ["<leader>s"] = {
--     _ = "which_key_ignore",
--     name = "[S]earch"
--   },
--   ["<leader>w"] = {
--     _ = "which_key_ignore",
--     name = "[W]orkspace"
--   }
-- }
--
-- -- Suggested Spec:
-- {
--   { "<leader>c", group = "[C]ode" },
--   { "<leader>c_", hidden = true },
--   { "<leader>d", group = "[D]ocument" },
--   { "<leader>d_", hidden = true },
--   { "<leader>r", group = "[R]ename" },
--   { "<leader>r_", hidden = true },
--   { "<leader>s", group = "[S]earch" },
--   { "<leader>s_", hidden = true },
--   { "<leader>w", group = "[W]orkspace" },
--   { "<leader>w_", hidden = true },
-- }
--
