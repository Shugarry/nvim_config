local builtin = require('telescope.builtin')

return {
	-- TELESCOPE KEYMAPS
	vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope: Find Files' }),
	vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope: Live Grep' }),
	vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope: Buffers' }),
	vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope: Help Tags' }),

	-- NEOTREE KEYMAPS
	vim.keymap.set('n', '<leader>tt', '<cmd>Neotree toggle<CR>', { desc = 'Neotree: Toggle' }),
	vim.keymap.set('n', '<leader>tr', '<cmd>Neotree dir=%:p:h<CR>', { desc = 'Neotree: reset tree to path of file' }),
	vim.keymap.set('n', '<leader>tb', '<cmd>Neotree toggle show buffers left<CR>', { desc = 'Neotree: show buffers' }),

	-- BARBAR KEYMAPS
	vim.keymap.set('n', '<C-Down>', function()
		if #vim.fn.getbufinfo({buflisted = 1}) > 1 then
			vim.cmd('BufferClose')
		else
			vim.cmd('q')
		end
	end, { noremap = true, silent = true }),
	vim.keymap.set('n', '<C-Right>', '<cmd>BufferNext<CR>', { desc = 'Buffer: Next', noremap = true, silent = true }),
	vim.keymap.set('n', '<C-Left>', '<cmd>BufferPrevious<CR>', { desc = 'Buffer: Previous', noremap = true, silent = true }),
	vim.keymap.set('n', '<C-S>', '<cmd>wa<CR>', {desc = 'Save File'}),

	-- TRANSPARENT.NVIM KEYMAPS
	vim.keymap.set('n', '<leader>T', '<cmd>TransparentToggle<CR>', { desc = 'Transparency toggle' }),

	-- LSP KEYMAPS
	

	-- GRUG-FAR KEYMAPS
	vim.keymap.set('n', '<leader>gf', '<cmd>Grug-far<CR>', { desc = 'Find and replace' }),

}
