return { --Movement in insert mode
	-- vim.keymap.set("n", "x", '"_x', { desc = "Delete without yanking" }),

	vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Move left", remap = true }),
	vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move right", remap = true }),
	vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Move down", remap = true }),
	vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Move up", remap = true }),

	-- Buffers movement and closing
	vim.keymap.set("n", "<S-TAB>", "<cmd>bp<cr>", { desc = "Prev buffer" }),
	vim.keymap.set("n", "<TAB>", "<cmd>bn<cr>", { desc = "Next buffer" }),
	vim.keymap.set("n", "<leader>x", "<cmd>bd<cr>", { desc = "Close buffer" }),

	-- Split screen
	-- vim.keymap.set("n", "ss", ":split<Return>", { desc = "Split screen" }),
	vim.keymap.set("n", "sv", ":vsplit<Return>", { desc = "Vertical split" }),

	--Telscope bindings(find)
	-- vim.keymap.set(
	-- 	"n",
	-- 	"<leader>fz",
	-- 	"<cmd> Telescope current_buffer_fuzzy_find <CR>",
	-- 	{ desc = "Find in current buffer" }
	-- ),
	vim.keymap.set(
		"n",
		"<leader>fa",
		"<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
		{ desc = "Find all" }
	),
	-- vim.keymap.set("n", "<leader>fw", "<cmd> Telescope live_grep <CR>", { desc = "Live grep" }),
	-- vim.keymap.set("n", "<leader>fb", "<cmd> Telescope buffers <CR>", { desc = "Find buffers" }),
	-- vim.keymap.set("n", "<leader>fh", "<cmd> Telescope help_tags <CR>", { desc = "Help page" }),

	--LSP actions
	-- vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", { desc = "Telescope Lsp Reference" }),
	-- vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Telescope Lsp Implementations" }),
	-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" }),
	-- vim.keymap.set("n", "gr", vim.lsp.buf.references, { silent = true, desc = "LSP references" }),
	-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { silent = true, desc = "LSP declaration" }),
	-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true, desc = "LSP definition" }),
	-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { silent = true, desc = "LSP implementation" }),
	-- vim.keymapjset("n", "<leader>D", vim.lsp.buf.type_definition, { silent = true, desc = "LSP type definition" }),

	-- vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Lsp Restart" }),
	-- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Lsp Buffer Rename" }),
	-- vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover information" }),

	-- Fast commenting
	-- vim.keymap.set("n", "<leader>/", function()
	-- 	require("Comment.api").toggle.linewise.current()
	-- end, { desc = "Toggle comment" }),

	-- vim.keymap.set(
	-- 	{ "v", "s" },
	-- 	"<leader>/",
	-- 	"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
	-- 	{ desc = "Toggle comment" }
	-- ),
}
