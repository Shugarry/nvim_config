return { -- WHICH-KEY
	"folke/which-key.nvim",
	opts = {},
	options = function()
		local wk = require("which-key")
		wk.setup({
			plugins = { spelling = { enabled = false } },
			disable = { filetypes = { "TelescopePrompt", "neo-tree" } }
		})
	end
}
