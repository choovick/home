return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- https://github.com/ibhagwan/fzf-lua?tab=readme-ov-file#default-options
		-- calling `setup` is optional for customization
		require("fzf-lua").setup({
			keymap = {
				fzf = {
					-- sets filtered items to quickfix list
					["CTRL-q"] = "select-all+accept",
				},
			},
			winopts = {
				fullscreen = true,
				preview = {
					-- default = "bat",
					horizontal = "right:40%",
				},
			},
		})
	end,
}
