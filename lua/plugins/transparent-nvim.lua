return { -- TRANSPARENT.NVIM
	"xiyaowong/transparent.nvim",
	options = function()
		vim.g.transparent_enabled=false
		require('transparent').clear_prefix('NeoTree')
		-- require('transparent').clear_prefix('lualine')
	end
}
