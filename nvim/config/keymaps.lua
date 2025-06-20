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
-- vim.keymap.set("n", "<leader>x", "<cmd>bd<cr>", { desc = "Close buffer" })

vim.keymap.set("n", "<leader>x", ":bp<bar>sp<bar>bn<bar>bd<CR>", { desc = "Close buffer" })

-- Split screen
vim.keymap.set("n", "ss", ":split<Return>", { desc = "Split screen" })
vim.keymap.set("n", "sv", ":vsplit<Return>", { desc = "Vertical split" })

----Telscope bindings(find)
--vim.keymap.set(
--  "n",
--  "<leader>fa",
--  "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
--  { desc = "Find all" }
--)
--
--fzf bindings
--#region

-- vim.keymap.set("n", "<leader>rs", "<cmd>FzfLua resume<cr>", { desc = "Resume" })
-- vim.keymap.set("n", "<leader>/", function()
--   require("fzf-lua").blines()
-- end, { desc = "[/] Fuzzily search lines in current buffer" })
-- [[ Basic Autocommands ]]
-- vim.api.nvim_create_autocmd("TextYankPost", {
-- 	desc = "Highlight when yanking (copying) text",
-- 	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
-- 	callback = function()
-- 		vim.highlight.on_yank()
-- 	end,
-- })

-- Function for note-taking

local spawn_note_window_vimscript = [[function! Spawn_note_window() abort
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
]]
vim.api.nvim_exec(spawn_note_window_vimscript, false)
vim.keymap.set("n", "<leader>sq", ":call Spawn_note_window()<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>se", function()
	require("snacks.picker").files({
		cwd = vim.fn.expand("~/Documents/notes/workNotes/"), -- Specify the directory
	})
end, { noremap = true, silent = true, desc = "Search Work Notes" })

vim.keymap.set("n", "<leader><space>", function()
	require("snacks.picker").buffers()
	-- sort = function(buffers)
	-- 	-- Sort by last used or most recently used
	-- 	table.sort(buffers, function(a, b)
	-- 		return a.lastused > b.lastused
	-- 	end)
	-- 	return buffers
	-- end,
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

-- Define the function in the global namespace
_G.open_in_finder = function()
	local file_path = vim.fn.expand("%:p:h") -- Get the directory of the current file
	os.execute('open "' .. file_path .. '"')
end

-- Map the function to a keybinding
vim.api.nvim_set_keymap(
	"n",
	"<leader>of",
	":lua open_in_finder()<CR>",
	{ noremap = true, silent = true, desc = "Open [F]ile in Finder" }
)

vim.keymap.set("n", "<leader>gf", function()
	Snacks.lazygit.log_file()
end, { desc = "Snacks git history" })

vim.keymap.set({ "n", "t" }, "<leader>tt", function()
	Snacks.terminal()
end, { desc = "Toggle terminal" })
