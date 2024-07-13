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
		-- -- and hide <leader>1
		--
		wk.add({
			-- group renames
			{ "<leader>a", group = "actions" },
			{ "<leader>c", group = "code" },
			{ "<leader>C", group = "CopilotChat" },
			{ "<leader>e", group = "explorer" },
			{ "<leader>f", group = "find" },
			{ "<leader>h", group = "harpoon" },
			{ "<leader>n", group = "no" },
			{ "<leader>q", group = "quickfix" },
			{ "<leader>s", group = "split" },
			{ "<leader>t", group = "tabs" },
			{ "<leader>w", group = "window" },
			{ "<leader>x", group = "diag" },
		}, { prefix = "<leader>" })
	end,
	opts = {
		-- any additional options
		-- show a warning when issues were detected with your mappings
		notify = true,
	},
}
