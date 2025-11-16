return {
	"Shatur/neovim-ayu",
	priority = 1000,
	init = function()
		vim.cmd.colorscheme("greyhome")
		vim.cmd.hi("Comment gui=none")
	end,
}
