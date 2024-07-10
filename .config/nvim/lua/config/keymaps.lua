-- set leader key to space
vim.g.mapleader = " "

-- set keymaps
local keymap = vim.keymap -- for conciseness

-- use jk to exit insert mode
keymap.set({ "i", "v" }, "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- save file command
keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Lazy hotkey
keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Mason
keymap.set("n", "<leader>M", "<cmd>Mason<cr>", { desc = "Mason" })

-- Trim
keymap.set("n", "<leader>ct", "<cmd>Trim<cr>", { desc = "Trim Whitespaces" })

-- increment/decrement number
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement
-- neotree
keymap.set("n", "<leader>ee", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file explorer" }) -- toggle file explorer
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- quickfix
keymap.set("n", "<leader>qq", "<cmd>copen<CR>", { desc = "Open quickfix" }) -- open quickfix
keymap.set("n", "<leader>qc", "<cmd>cclose<CR>", { desc = "Close quickfix" }) -- close quickfix
keymap.set("n", "<leader>qn", "<cmd>cnext<CR>", { desc = "Go to next quickfix" }) -- go to next quickfix
keymap.set("n", "<leader>qp", "<cmd>cprev<CR>", { desc = "Go to previous quickfix" }) -- go to previous quickfix

-- Define a global function to change directory to git root
_G.change_to_git_root = function()
	local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
	if git_root and git_root ~= "" then
		vim.cmd("cd " .. git_root)
		print("Changed directory to " .. git_root)
	else
		print("Not in a git repository")
	end
end

-- Keymap to trigger the function
vim.api.nvim_set_keymap(
	"n",
	"<leader>er",
	":lua change_to_git_root()<CR>",
	{ noremap = true, silent = true, desc = "Change directory to git root" }
)

-- Define a global function to change the current working directory to the directory of the current buffer
_G.switch_cwd_to_current_buffer = function()
	local buffer_name = vim.api.nvim_buf_get_name(0)
	if buffer_name == "" then
		print("No file in the current buffer")
		return
	end
	local buffer_dir = vim.fn.fnamemodify(buffer_name, ":p:h")
	vim.cmd("cd " .. buffer_dir)
	print("Changed directory to " .. buffer_dir)
end

-- Keymap to call the global function (you can customize <leader>cd to your preferred key combination)
vim.api.nvim_set_keymap(
	"n",
	"<leader>eb",
	":lua _G.switch_cwd_to_current_buffer()<CR>",
	{ noremap = true, silent = true, desc = "Change directory to current buffer" }
)

--
-- -- JSON unescape
-- function _G.unescape_json()
-- 	-- Get the current visual selection
-- 	local start_pos = vim.fn.getpos("'<")
-- 	local end_pos = vim.fn.getpos("'>")
-- 	local lines = vim.fn.getline(start_pos[2], end_pos[2])
-- 	local selection = table.concat(lines, "\n")
--
-- 	-- Run jq to un-escape the JSON string
-- 	local handle = io.popen("echo " .. vim.fn.shellescape(selection) .. " | jq -R -r .")
-- 	local result = handle:read("*a")
-- 	handle:close()
--
-- 	-- Replace the visual selection with the result
-- 	vim.fn.setline(start_pos[2], vim.split(result, "\n"))
-- end
--
-- vim.api.nvim_set_keymap("v", "<leader>u", ":lua unescape_json()<CR>", { noremap = true, silent = true })

-- ACTIONS
-- clear search highlights
keymap.set("n", "<leader>ah", ":nohl<CR>", { desc = "Clear search highlights" })

-- to convert yaml to json using: yq -p yaml -o json
keymap.set(
	{ "v", "n" },
	"<leader>aj",
	":%!yq -p yaml -o json<CR>",
	{ noremap = true, silent = true, desc = "Convert yaml to json" }
)
-- to convert json to yaml using: yq -p json -o yaml
keymap.set(
	{ "v", "n" },
	"<leader>ay",
	":%!yq -p json -o yaml<CR>",
	{ noremap = true, silent = true, desc = "Convert json to yaml (Unminify JSON)" }
)
-- unescape json string using jq
keymap.set(
	{ "v", "n" },
	"<leader>aE",
	":%!jq -r .<CR>",
	{ noremap = true, silent = true, desc = "Unescape JSON string" }
)
-- escape stining to json string using jq
keymap.set(
	{ "v", "n" },
	"<leader>ae",
	":%!jq -Rsa .<CR>",
	{ noremap = true, silent = true, desc = "Escape string to JSON string" }
)

-- json minify using jq
keymap.set({ "v", "n" }, "<leader>am", ":%!jq -c .<CR>", { noremap = true, silent = true, desc = "Minify JSON" })

-- base64 encode using <leader>ab
keymap.set({ "v", "n" }, "<leader>ab", ":%!base64<CR>", { noremap = true, silent = true, desc = "Base64 encode" })

-- base64 decode using <leader>aB
keymap.set({ "v", "n" }, "<leader>aB", ":%!base64 -d<CR>", { noremap = true, silent = true, desc = "Base64 decode" })

-- use openssl to decode certifcate using: openssl x509 -in /dev/stdin -text -noout
keymap.set(
	{ "v", "n" },
	"<leader>ac",
	":%!openssl x509 -in /dev/stdin -text -noout<CR>",
	{ noremap = true, silent = true, desc = "Decode certificate" }
)
