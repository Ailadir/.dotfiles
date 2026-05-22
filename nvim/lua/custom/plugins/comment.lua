return {
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		lazy = true,
		opts = {
			enable_autocmd = false,
		},
	},
	-- {
	-- 	"LazyVim/LazyVim",
	-- 	opts = function()
	-- 		-- Dynamically overrides Neovim's native commenting engine to check treesitter hooks
	-- 		local get_option = vim.filetype.get_option
	-- 		vim.filetype.get_option = function(filetype, option)
	-- 			return option == "commentstring"
	-- 					and require("ts_context_commentstring.internal").calculate_commentstring()
	-- 				or get_option(filetype, option)
	-- 		end
	-- 	end,
	-- },
}
