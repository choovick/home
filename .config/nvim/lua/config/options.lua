local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- word wrap
-- disable line wrapping by default
opt.wrap = false
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    vim.opt.wrap = true
  end,
})

-- see non printable characters
opt.list = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swap file
opt.swapfile = false

-- change indents for markdown
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "markdown",
--   callback = function()
--     vim.opt.shiftwidth = 4
--     vim.opt.tabstop = 4
--   end,
-- })

-- Highlight on yank
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- delayed VimEnter function in case need something
-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
-- 	callback = function()
-- 		-- Delay the execution of the update function by 1 second
-- 		vim.defer_fn(function()
-- 			-- to fix the issue with lualine picking theme based on system appearance.
-- 			print("Vim entered")
-- 		end, 1000)
-- 	end,
-- })

-- setting language to en_us
vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- BACKGROUND COLOR FOR INACTIVE WINDOWS
-- Set up autocommand for entering a buffer
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.cmd("highlight NormalBackground guibg=NONE") -- Replace NONE with your preferred background color
    vim.api.nvim_win_set_option(0, "winhl", "Normal:NormalBackground")
  end,
})

-- Set up autocommand for leaving a buffer
vim.api.nvim_create_autocmd("BufLeave", {
  callback = function()
    if vim.o.background == "dark" then
      vim.cmd("highlight InactiveBackground guibg=#3C3836")
    else
      vim.cmd("highlight InactiveBackground guibg=#A9A9A9")
    end

    -- vim.cmd("highlight InactiveBackground guibg=NONE")
    vim.api.nvim_win_set_option(0, "winhl", "Normal:InactiveBackground")
  end,
})

-- Optional: Apply the InactiveBackground on startup for inactive windows
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if win ~= vim.api.nvim_get_current_win() then
        if vim.o.background == "dark" then
          vim.cmd("highlight InactiveBackground guibg=#3C3836")
        else
          vim.cmd("highlight InactiveBackground guibg=#A9A9A9")
        end

        vim.api.nvim_win_set_option(win, "winhl", "Normal:InactiveBackground")
      end
    end
  end,
})
--/BACKGROUND COLOR FOR INACTIVE WINDOWS
