vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.api.nvim_set_keymap(
	"n",
	"<leader>rn",
	"<cmd>lua vim.lsp.buf.rename()<CR>",
	{ noremap = true, silent = true, desc = "[R]ename variable" }
)

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

--
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Move left", remap = true })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move right", remap = true })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Move down", remap = true })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Move up", remap = true })

-- Buffers movement and closing
vim.keymap.set("n", "<S-TAB>", "<cmd>bp<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<TAB>", "<cmd>bn<cr>", { desc = "Next buffer" })

vim.keymap.set("n", "<leader>x", ":bp<bar>sp<bar>bn<bar>bd<CR>", { desc = "Close buffer" })

-- Split screen
vim.keymap.set("n", "sV", ":split<Return>", { desc = "Split screen" })
vim.keymap.set("n", "sv", ":vsplit<Return>", { desc = "Vertical split" })

--Note taking functionality
vim.api.nvim_exec([[
function! Spawn_note_window() abort
  let path = "~/Documents/notes/workNotes/dailyNotes/"
  let file_name = path.strftime("note-%d-%m-%y.md")
  " Empty buffer
  let buf = nvim_create_buf(v:false, v:true)
  " Get current UI
  let ui = nvim_list_uis()[0]
  " Dimension
  let width = (ui.width/2)
  let height = (ui.height/2)
  " Options for new window
  let opts = {'relative': 'editor',
              \ 'width': width,
              \ 'height': height,
              \ 'col': (ui.width - width)/2,
              \ 'row': (ui.height - height)/2,
              \ 'anchor': 'NW',
              \ 'style': 'minimal',
              \ 'border': 'single',
              \ }
  " Spawn window
  let win = nvim_open_win(buf, 1, opts)
  " Now we can actually open or create the note for the day?
  if filereadable(expand(file_name))
    execute "e ".fnameescape(file_name)
    let column = 150
    execute "set textwidth=".column
    execute "set colorcolumn=".column
    execute "norm Go"
    execute "norm zz"
    execute "startinsert"
  else
    execute "e ".fnameescape(file_name)
    let column = 150
    execute "set textwidth=".column
    execute "set colorcolumn=".column
    execute "norm Gi# Notes for ".strftime("%d-%m-%y")." #"
    execute "norm G2o"
    execute "norm Gi- " 
    execute "norm zz"
    execute "startinsert"
  endif
endfunction
]], false)

vim.keymap.set("n", "<leader>sq", ":call Spawn_note_window()<CR>", { noremap = true, silent = true })

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

--Snack search TODO
-- vim.api.nvim_create_autocmd("VimEnter", {
-- 	callback = function()
-- 		vim.keymap.del("n", "<leader>st")
-- 		vim.keymap.set(
-- 			"n",
-- 			"<leader>st",
-- 			"<cmd>TodoQuickFix<cr>",
-- 			{ desc = "Todo in current directory", remap = false }
-- 		)
-- 	end,
-- })
vim.keymap.set("n", "<leader>stt", "<cmd>TodoTrouble<cr>", { desc = "Todo in current directory", remap = false })

--Terminal at the bottom
vim.keymap.set({ "n", "t" }, "<leader>tt", function()
	Snacks.terminal(nil, { cwd = vim.fn.getcwd(0) })
end, { desc = "Toggle terminal" })

--Github CopilotChat keymaps
vim.keymap.set("n", "<leader>aa", "<cmd>CopilotChatToggle<cr>", { desc = "Toggle Copilot Chat" })
vim.keymap.set("n", "<leader>as", "<cmd>CopilotChatSave<cr>", { desc = "Save Copilot Chat Session" })
vim.keymap.set("n", "<leader>al", "<cmd>CopilotChatLoad<cr>", { desc = "Load Copilot Chat Session" })
vim.keymap.set("n", "<leader>am", "<cmd>CopilotChatModels<CR>", { desc = "View/select available CopilotChat models" })
vim.keymap.set("n", "<leader>aA", "<cmd>CopilotChatAgents<CR>", { desc = "View/select available CopilotChat agents" })

vim.keymap.set("n", "<leader>s.", function()
	Snacks.picker.resume()
end, { desc = "Resume last picker" })

vim.keymap.set("n", "<leader>fG", function()
	require("snacks.picker").git_status({
		finder = "git_status",
		show_empty = true,
		format = "git_status",
		preview = "git_status",
	})
end, { desc = "Show changed (uncommitted) git files" })

local function toggle_copilot()
	local enabled = vim.g.copilot_enabled or false
	if enabled then
		vim.cmd("Copilot disable")
	else
		vim.cmd("Copilot enable")
	end
	vim.g.copilot_enabled = not enabled
end

vim.keymap.set("n", "<leader>ct", toggle_copilot, { noremap = true, silent = true })
