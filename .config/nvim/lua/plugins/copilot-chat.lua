return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		-- https://github.com/jellydn/lazy-nvim-ide/blob/main/lua/plugins/extras/copilot-chat-v2.lua
		-- https://github.com/CopilotC-Nvim/CopilotChat.nvim?tab=readme-ov-file#default-configuration
		opts = {
			debug = true, -- Enable debugging
			-- See Configuration section for rest
		},
		-- See Commands section for default commands if you want to lazy load on them
		keys = {
			-- Show help actions with fzf-lua
			{
				"<leader>Ch",
				function()
					local actions = require("CopilotChat.actions")
					require("CopilotChat.integrations.fzflua").pick(actions.help_actions())
				end,
				desc = "CopilotChat - Help actions",
			},
			-- Show prompts actions with fzf-lua
			{
				"<leader>Cp",
				function()
					local actions = require("CopilotChat.actions")
					require("CopilotChat.integrations.fzflua").pick(actions.prompt_actions())
				end,
				desc = "CopilotChat - Prompt actions",
			},
			-- Quick chat with Copilot
			{
				"<leader>Cq",
				function()
					local input = vim.fn.input("Quick Chat: ")
					if input ~= "" then
						require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
					end
				end,
				desc = "CopilotChat - Quick chat",
			},
			-- Toggle CopilotChat
			{
				"<leader>Ct",
				function()
					require("CopilotChat").toggle()
				end,
				desc = "CopilotChat - Toggle",
			},
		},
	},
}
