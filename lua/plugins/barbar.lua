return { -- BARBAR
	'romgrk/barbar.nvim',
	dependencies = {
		'lewis6991/gitsigns.nvim',
		'nvim-tree/nvim-web-devicons',
	},
	init = function() vim.g.barbar_auto_setup = false end,
	opts = {},
	options = function()
		require('barbar').setup({
			clickable = true ,
			auto_hide = true,
		})
	end
}
