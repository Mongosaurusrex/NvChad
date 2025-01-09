local builtin = require("telescope.builtin")

vim.keymap.set('n', '<C-P>', builtin.find_files, {})
vim.keymap.set('n', '<S-p>', builtin.live_grep, {})
