return {
	{
		"andymass/vim-matchup",
		event = "BufReadPost",
		init = function()
			-- Must be set BEFORE the plugin loads
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.matchup = { enable = true }
		end,
	},
}
