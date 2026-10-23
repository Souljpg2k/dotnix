require("gitsigns").setup()
require("ibl").setup({
    indent = {
        char = "│",
    },
    scope = {
        enabled = true,
        char = "│",
    },
})

require("nvim-autopairs").setup({
    check_ts = false,
})

local set = vim.opt

set.number = true
set.relativenumber = false

set.tabstop = 4
set.shiftwidth = 4
set.autoindent = true
set.expandtab = true
set.wrap = false

set.ignorecase = true
set.smartcase = true
set.incsearch = true

set.swapfile = false
set.backup = false

set.clipboard = "unnamedplus"

set.cursorline = true

set.fillchars:append({ eob = " " })

set.termguicolors = true
set.background = "dark"
set.signcolumn = "yes"

vim.cmd.syntax("on")

require("tokyonight").setup({
    style = "night",
    transparent = true,
})
vim.cmd.colorscheme("tokyonight")

vim.api.nvim_create_autocmd("FileType", {
    pattern = "nix",
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local line_count = vim.api.nvim_buf_line_count(0)

        if mark[1] > 0 and mark[1] <= line_count then
            vim.api.nvim_win_set_cursor(0, mark)
        end
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "lua", "nix" },
    callback = function()
        vim.treesitter.start()
    end,
})
