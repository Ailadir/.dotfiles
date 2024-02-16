return {
	"numToStr/FTerm.nvim",
	opts = {},
	keys = {
		{ "<leader>tt", '<CMD>lua require("FTerm").toggle()<CR>', desc = "Open terminal" },
	},
	config = function()
		vim.keymap.set("t", "<leader>tt", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
	end,
}
