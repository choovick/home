return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")
		-- As an example, we will create the following mappings:
		--  * <leader>ff find files
		--  * <leader>fr show recent files
		--  * <leader>fb Foobar
		-- we'll document:
		--  * <leader>fn new file
		--  * <leader>fe edit file
		-- and hide <leader>1

		wk.register({
			-- group renames
			e = {
				name = "+explorer",
			},
			s = {
				name = "+split",
			},
			h = {
				name = "+harpoon",
			},
			t = {
				name = "+tabs",
			},
			n = {
				name = "+no",
			},
			f = {
				name = "+find",
			},
			c = {
				name = "+code",
			},
			x = {
				name = "+diag",
			},
			w = {
				name = "+window",
			},
			q = {
				name = "+quickfix",
			},
		}, { prefix = "<leader>" })
	end,
	opts = {
		-- any additional options
	},
}
