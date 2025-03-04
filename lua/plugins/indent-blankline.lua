return { -- INDENT-BLANKLINE
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = {},
	options = function()
		require("ibl").setup {}
	end
}
