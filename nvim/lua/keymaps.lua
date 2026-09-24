-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- vim: ts=2 sts=2 sw=2 et
--
vim.keymap.set("n", "<leader>qs", function()
	require("persistence").load()
end)

-- Buffers
--
vim.keymap.set("n", "<S-TAB>", "<cmd>bp<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<TAB>", "<cmd>bn<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>x", ":bp<bar>sp<bar>bn<bar>bd<CR>", { desc = "Close buffer" })

-- Split screen
--
vim.keymap.set("n", "sV", ":split<Return>", { desc = "Split screen" })
vim.keymap.set("n", "sv", ":vsplit<Return>", { desc = "Vertical split" })

--Diagnostic
--
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })

--Copilot chat
--
--Github CopilotChat keymaps
vim.keymap.set("n", "<leader>aa", "<cmd>CopilotChatToggle<cr>", { desc = "Toggle Copilot Chat" })
vim.keymap.set("n", "<leader>am", "<cmd>CopilotChatModels<CR>", { desc = "View/select available CopilotChat models" })
vim.keymap.set("n", "<leader>aA", "<cmd>CopilotChatAgents<CR>", { desc = "View/select available CopilotChat agents" })

-- Snack
vim.keymap.set("n", "<leader>se", function()
	require("snacks.picker").files({
		cwd = vim.fn.expand("~/Documents/notes/workNotes/"), -- Specify the directory
	})
end, { noremap = true, silent = true, desc = "Search Work Notes" })

--
-- Snacks search between buffers
vim.keymap.set("n", "<leader><space>", function()
	require("snacks.picker").buffers()
end, { desc = "Search buffers" })

-- Neogit and Diffview keymaps
vim.api.nvim_set_keymap("n", "<leader>gn", "<CMD>Neogit<CR>", { desc = "Open neogit", noremap = true, silent = true })
vim.keymap.set("n", "<leader>gd", function()
	if next(require("diffview.lib").views) == nil then
		vim.cmd("DiffviewFileHistory %")
	else
		vim.cmd("DiffviewClose")
	end
end, { desc = "Toggle diffView filehistory", noremap = true, silent = true })

--FileGitHistory
vim.keymap.set("n", "<leader>gf", function()
	Snacks.lazygit.log_file()
end, { desc = "Snacks git history" })

--Open current file in Finder
_G.open_in_finder = function()
	local dir_path = vim.fn.expand("%:p:h")
	os.execute('open "' .. dir_path .. '"')
end
vim.api.nvim_set_keymap(
	"n",
	"<leader>of",
	":lua open_in_finder()<CR>",
	{ noremap = true, silent = true, desc = "Open [F]ile in Finder" }
)

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("ProtoLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Set keymap to go to definition
		local opts = { buffer = ev.buf, silent = true }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

		-- Optional: Jump back to where you were
		vim.keymap.set("n", "<C-t>", "<C-o>", opts)
	end,
})

vim.keymap.set("n", "<leader>ft", function()
	Snacks.picker.todo_comments() ---@diagnostic disable-line: undefined-field
end, { desc = "TODO" })

-- Force snippet jump forward even if autocompletion is active
vim.keymap.set({ "i", "s" }, "<C-l>", function()
	-- 1. Try Neovim native snippet fallback
	if vim.snippet and vim.snippet.active({ direction = 1 }) then
		return vim.snippet.jump(1)
	end

	-- 2. Try LuaSnip fallback if active
	local luasnip_ok, luasnip = pcall(require, "luasnip")
	if luasnip_ok and luasnip.jumpable(1) then
		return luasnip.jump(1)
	end

	-- 3. Fallback to normal behavior if no snippet is running
	return "<C-l>"
end, { expr = true, silent = true, desc = "Snippet jump forward" })

-- Force snippet jump backward
vim.keymap.set({ "i", "s" }, "<C-h>", function()
	if vim.snippet and vim.snippet.active({ direction = -1 }) then
		return vim.snippet.jump(-1)
	end

	local luasnip_ok, luasnip = pcall(require, "luasnip")
	if luasnip_ok and luasnip.jumpable(-1) then
		return luasnip.jump(-1)
	end

	return "<C-h>"
end, { expr = true, silent = true, desc = "Snippet jump backward" })
