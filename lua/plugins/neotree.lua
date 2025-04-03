return { -- NEOTREE
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()

		require("neo-tree").setup({
			window = {
				width = 25,
				auto_expand_width = false,
				mappings = {
					["<CR>"] = {
						command = function(state)
							local node = state.tree:get_node()
							if node.type == "file" then
								-- Open file in a new buffer
								vim.cmd("wincmd h") -- Move to the right window first
								vim.cmd("edit " .. node.path)
								-- Return focus to neo-tree
								vim.cmd("wincmd l")
							else
								-- Default behavior for directories
								require("neo-tree.sources.filesystem.commands").open(state)
							end
						end,
						desc = "Open file and keep focus on neo-tree",
					}
				}
			},
		})

		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				-- Open NeoTree only if no file is specified when launching NeoVim
				if vim.fn.argc() == 0 then
					--vim.cmd("Neotree action=show")
					vim.cmd("Neotree position=current")
				end
			end,
		})

		vim.api.nvim_create_autocmd("QuitPre", {
			callback = function()
				local invalid_win = {}
				local wins = vim.api.nvim_list_wins()
				for _, w in ipairs(wins) do
					local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
					if bufname:match("neo%-tree") then
						table.insert(invalid_win, w)
					end
				end
				if #invalid_win == #wins - 1 then
					-- Should quit, close all invalid windows
					for _, w in ipairs(invalid_win) do
						vim.api.nvim_win_close(w, true)
					end
				end
			end,
		})

	end
}
