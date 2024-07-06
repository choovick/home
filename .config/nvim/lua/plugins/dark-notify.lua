return {
	"cormacrelf/dark-notify",
	config = function()
		local dn = require("dark_notify")

		-- Configure https://github.com/cormacrelf/dark-notify
		dn.run({
			schemes = {
				-- you can use a different colorscheme for each
				dark = "catppuccin-mocha",
				-- even a different `set background=light/dark` setting or lightline theme
				-- if you use lightline, you may want to configure lightline themes,
				-- even if they're the same one, especially if the theme reacts to :set bg
				light = {
					colorscheme = "catppuccin-latte",
				},
			},
			onchange = function(mode)
				-- optional, you can configure your own things to react to changes.
				-- this is called at startup and every time dark mode is switched,
				-- either via the OS, or because you manually set/toggled the mode.
				-- mode is either "light" or "dark"
				if mode == "dark" then
					-- do something
					-- run shell commands:
					-- tmux set -g @catppuccin_flavour 'latte'
					-- tmux run '~/.tmux/plugins/tpm/tpm'
					-- vim.api.nvim_command("silent \"!tmux set -g @catppuccin_flavour 'mocha'\"")
					-- vim.api.nvim_command("silent \"!tmux run '~/.tmux/plugins/tpm/tpm'\"")
				else
					-- vim.api.nvim_command("silent \"!tmux set -g @catppuccin_flavour 'latte'\"")
					-- vim.api.nvim_command("silent \"!tmux run '~/.tmux/plugins/tpm/tpm'\"")
				end
			end,
		})
	end,
}
