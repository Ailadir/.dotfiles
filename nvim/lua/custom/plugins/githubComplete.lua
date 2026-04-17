return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false }, -- handled by blink-cmp-copilot
				panel = { enabled = false },
			})

			vim.keymap.set("n", "<leader>ta", function()
				require("copilot.suggestion").toggle_auto_trigger()
				vim.notify("Copilot toggled")
			end, { desc = "[T]oggle Copilot [A]I" })
		end,
	},
}
