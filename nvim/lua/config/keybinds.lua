vim.g.mapleader = " "
vim.g.maplocalleader = " "

local set = vim.keymap.set

-- GENERAL

-- move selection
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

-- yank paste register utility
set({ "n", "v" }, "<leader>p", [["_dP]])
set("n", "<leader>v", [["+p]])
set({ "n", "v" }, "<leader>y", [["+y]])
set("n", "<leader>Y", [["+Y]])
set({ "n", "v" }, "<leader>d", [["_d]])

-- start substitution for word under cursor
set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- LSP

set("n", "gd", function() vim.lsp.buf.definition() end)
set("n", "K", function() vim.lsp.buf.hover() end)
set("n", "<leader>ee", function() vim.diagnostic.open_float() end)
set("n", "<leader>en", function() vim.diagnostic.goto_next() end)
set("n", "<leader>ep", function() vim.diagnostic.goto_prev() end)
set("n", "<leader>ca", function() vim.lsp.buf.code_action() end)
set("n", "<leader>rf", function() vim.lsp.buf.references() end)
set("n", "<leader>rn", function() vim.lsp.buf.rename() end)
set("n", "<leader>fx", function() vim.lsp.buf.format({ async = true }) end)
