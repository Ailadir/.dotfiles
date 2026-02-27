return {
	"github/copilot.vim",
	config = function()
		vim.g.copilot_no_tab_map = true
		vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { expr = true, silent = true, noremap = true })

		vim.keymap.set("n", "<leader>ta", function()
			if vim.fn["copilot#Enabled"]() == 1 then
				vim.cmd("Copilot disable")
				vim.notify("Copilot disabled")
			else
				vim.cmd("Copilot enable")
				vim.notify("Copilot enabled")
			end
		end, { desc = "[T]oggle Copilot [A]I" })
	end,
}
