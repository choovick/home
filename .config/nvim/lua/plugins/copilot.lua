return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	build = ":Copilot auth",
	opts = {
		-- for lua-cmp
		suggestion = {
			enabled = true,
			auto_trigger = true,
			hide_during_completion = true,
			debounce = 75,
			keymap = {
				accept = "<M-l>",
				accept_word = "<M-j>",
				accept_line = "<M-k>",
				next = "<M-]>",
				prev = "<M-[>",
				dismiss = "<C-]>",
			},
		},
		-- panel = { enabled = false },
		-- filetypes
		filetypes = {
			markdown = true, -- overrides default
			-- terraform = false, -- disallow specific filetype
			sh = function()
				if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
					-- disable for .env files
					return false
				end
				return true
			end,
		},
	},
}
