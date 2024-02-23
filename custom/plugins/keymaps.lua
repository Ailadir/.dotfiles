-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

return { --Movement in insert mode
	vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Move left" }),
	vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move right" }),
	vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Move down" }),
	vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Move up" }),

	-- Buffers movement and closing
	vim.keymap.set("n", "<S-TAB>", "<cmd>bprevious<cr>", { desc = "Prev buffer" }),
	vim.keymap.set("n", "<TAB>", "<cmd>bnext<cr>", { desc = "Next buffer" }),
	vim.keymap.set("n", "<leader>x", "<cmd>bd<cr>", { desc = "Close bufer" }),

	--Telscope bindings(find)
	vim.keymap.set("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>", { desc = "Find oldfiles" }),
	vim.keymap.set(
		"n",
		"<leader>fz",
		"<cmd> Telescope current_buffer_fuzzy_find <CR>",
		{ desc = "Find in current buffer" }
	),
	vim.keymap.set("n", "<leader>ff", "<cmd> Telescope find_files <CR>", { desc = "Find files" }),
	vim.keymap.set(
		"n",
		"<leader>fa",
		"<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
		{ desc = "Find all" }
	),
	vim.keymap.set("n", "<leader>fw", "<cmd> Telescope live_grep <CR>", { desc = "Live grep" }),
	vim.keymap.set("n", "<leader>fb", "<cmd> Telescope buffers <CR>", { desc = "Find buffers" }),
	vim.keymap.set("n", "<leader>fh", "<cmd> Telescope help_tags <CR>", { desc = "Help page" }),

	--LSP actions
	vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { silent = true, desc = "LSP references" }),
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { silent = true, desc = "LSP declaration" }),
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true, desc = "LSP definition" }),
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { silent = true, desc = "LSP implementation" }),
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { silent = true, desc = "LSP type definition" }),

	-- Fast commenting
	vim.keymap.set("n", "<leader>/", function()
		require("Comment.api").toggle.linewise.current()
	end, { desc = "Toggle comment" }),

	vim.keymap.set(
		{ "v", "s" },
		"<leader>/",
		"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
		{ desc = "Toggle comment" }
	),
}
