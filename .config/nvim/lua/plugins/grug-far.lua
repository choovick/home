return {
	"MagicDuck/grug-far.nvim",
	config = function()
		require("grug-far").setup({
			-- https://github.com/MagicDuck/grug-far.nvim/blob/main/lua/grug-far/opts.lua
			extraRgArgs = "--follow ",
		})
	end,
}
