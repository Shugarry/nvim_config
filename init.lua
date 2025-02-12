-- VIM OPTIONS
-- Line numbers and mouse support
vim.opt.number = true
vim.opt.mouse = "a"

-- Indentation
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.smartindent = true

-- UI
vim.opt.colorcolumn = "80"

-- History
vim.opt.history = 1000

-- VIM OPTIONS

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- add your plugins here
    { -- KANAGAWA COLORSCHEME
            "rebelot/kanagawa.nvim",
            priority=1000
        },
        { -- TELESCOPE
            'nvim-telescope/telescope.nvim', tag = '0.1.8',
            dependencies = { 'nvim-lua/plenary.nvim' }
        },
        { -- TREESITTER
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate"
        },
        { -- NEO TREE
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v3.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
                "MunifTanjim/nui.nvim",
                -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
            }
        },
        {'romgrk/barbar.nvim',
            dependencies = {
                'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
                'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
            },
            init = function() vim.g.barbar_auto_setup = false end,
            opts = {
                -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
                -- animation = true,
                -- insert_at_start = true,
                -- …etc.
            },
            version = '^1.0.0', -- optional: only update when a new 1.x version is released
        }
    },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- COLORSCHEME CONFIG
require('kanagawa').setup({})
vim.cmd.colorscheme("kanagawa-dragon")

-- TELESCOPE CONFIG
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- TREESITTER CONFIG
local configs = require("nvim-treesitter.configs")
configs.setup(
    {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },  
    })

-- NEOTREE CONFIG
require("neo-tree").setup({
    default_component_configs = {
        container = {
            width = 100,  -- Set the default width of the sidebar
        },
    },
})

vim.keymap.set('n', '<leader>T', ':Neotree toggle<CR>', {})

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        -- Open NeoTree only if no file is specified when launching NeoVim
        if vim.fn.argc() == 0 then
            vim.cmd("Neotree action=show")
        end
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        -- Check if NeoTree is open
        local neo_tree_exists = vim.fn.bufname("%") == "neo-tree"
        if not neo_tree_exists then
            -- If NeoTree is not open, open it
            vim.cmd("Neotree action=show position=left")
        end
    end,
})

-- BARBAR CONFIG
vim.keymap.set('n', '<leader><Tab>', ':BufferNext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader><S-Tab>', ':BufferPrevious<CR>', { noremap = true, silent = true })


-- TODO 
-- fix column width Neotree
-- fix buffer switching
-- keep watching vids ig too
-- git test
