-- leader key
vim.g.mapleader = " "

local keymap = vim.keymap -- for consiseness
 -- keymap.set("i", "jk", "<ESC>", { desc = "Exit Insert mode with jk" })
 keymap.set("n", "<leader>ch", "<cmd>nohl<CR>", { desc = "Clear search highlights with space + c,h" })

-- open exlore
-- keymap.set("n", "<leader>e","<cmd>Explore<CR>", { desc = "Open Explorer" })


-- window managment keymaps
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertical"})
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontly"})
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Split window equaly"})
keymap.set("n", "<leader>sq", "<cmd>close<CR>", {desc = "Close Splited window"})

-- Tab management keymaps
keymap.set("n", "<M-l>", "<cmd>tabnext<CR>", { desc = "Switch to next tab" })
keymap.set("n", "<M-h>", "<cmd>tabprevious<CR>", { desc = "Switch to previous tab" })
keymap.set("n", "<leader>q", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<C-n>", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<C-d>", "<cmd>tabnew %<CR>", { desc = "Open current file in new tab" })


-- File Operaitons
keymap.set("i", "<C-s>", "<ESC>:w<CR>", { desc = "Save on ctrl + s"} )
keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save on ctrl + s"} )


-- nvimtree
keymap.set("n", "<C-b>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle Tree File Explorer"} )
keymap.set("n", "<leader>br", "<cmd>NvimTreeRefresh<CR>", { desc = "Refreshh Tree File Explorer"} )


-- telescope nvim
-- keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
--keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
--keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
--keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { desc = 'Find files' })
keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { desc = 'Live grep' })
keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { desc = 'Find buffers' })
keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { desc = 'Help tags' })
