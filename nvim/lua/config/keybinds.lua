vim.g.mapleader = " "
vim.g.maplocalleader = "//"

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- GENERAL
map({ "n", "v" }, "j", [[gj]])
map({ "n", "v" }, "k", [[gk]])

-- move selection
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- yank paste register utility
map({ "n", "v" }, "<leader>p", [["_dP]])
map("n", "<leader>v", [["+p]])
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])
map({ "n", "v" }, "<leader>d", [["_d]])

-- start substitutios
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]])
map("v", "<leader>s", [["sy<ESC>:%s/<C-r>s//g<Left><Left>]])

-- escape terminal mode
map("t", "<Esc>", [[<C-\><C-n>]])

-- LSP
map("n", "gd", function() vim.lsp.buf.definition() end)
map("n", "gi", function() vim.lsp.buf.implementation() end)
map("n", "gc", function() vim.lsp.buf.declaration() end)
map("n", "gt", function() vim.lsp.buf.type_definition() end)
map("n", "K", function() vim.lsp.buf.hover() end)
map("n", "<leader>ee", function() vim.diagnostic.open_float() end)
map("n", "<leader>en", function() vim.diagnostic.goto_next() end)
map("n", "<leader>ep", function() vim.diagnostic.goto_prev() end)
map("n", "<leader>ca", function() vim.lsp.buf.code_action() end)
map("n", "<leader>rf", function() vim.lsp.buf.references() end)
map("n", "<leader>rn", function() vim.lsp.buf.rename() end)
map("n", "<leader>fx", function() vim.lsp.buf.format({ async = true }) end)
