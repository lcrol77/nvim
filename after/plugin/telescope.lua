local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set("n", "<leader>vrr", builtin.lsp_references)
vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, { desc = "Go to implementation" })
vim.keymap.set('n', '<leader>pa', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>ps', function()
  local word = vim.fn.input("Grep > ")
  local file = vim.fn.expand("%:p")
  require('telescope.builtin').grep_string({
    search = word,
    search_dirs = { file },
  })
end)

