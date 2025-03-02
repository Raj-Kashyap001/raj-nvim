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
-- keymap.set("n", "<C-d>", "<cmd>tabnew %<CR>", { desc = "Open current file in new tab" })


-- File Operaitons
-- keymap.set("i", "<C-s>", "<ESC>:w<CR>", { desc = "Save on ctrl + s"} )
keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save on ctrl + s"} )
keymap.set("n", "<leader>q", "<cmd>q!<CR>", { desc = "Force Quit"} )



-- nvimtree
keymap.set("n", "<C-b>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle Tree File Explorer"} )
keymap.set("n", "<leader>br", "<cmd>NvimTreeRefresh<CR>", { desc = "Refreshh Tree File Explorer"} )


-- telescope nvim
keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { desc = 'Find files' })
keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { desc = 'Live grep' })
keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { desc = 'Find buffers' })
keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { desc = 'Help tags' })

-- linewrap 
keymap.set('n', '<leader>z', ':set wrap!<CR>', { desc = 'Toggle line wrapping', noremap = true, silent = true }) 

-- Map Alt + Left to scroll left
keymap.set('n', '<A-Left>', '3zh', { desc = 'Scroll left', noremap = true, silent = true })

-- Map Alt + Right to scroll right
keymap.set('n', '<A-Right>', '3zl', { desc = 'Scroll right', noremap = true, silent = true })

-- Move the current line down with Alt + Down in normal mode
keymap.set('n', '<A-Down>', ':m .+1<CR>==', { desc = 'Move line down', noremap = true, silent = true })

-- Move the current line up with Alt + Up in normal mode
keymap.set('n', '<A-Up>', ':m .-2<CR>==', { desc = 'Move line up', noremap = true, silent = true })

-- Move selected lines down with Alt + Down in visual mode
keymap.set('v', '<A-Down>', ':m \'>+1<CR>gv=gv', { desc = 'Move selected lines down', noremap = true, silent = true })

-- Move selected lines up with Alt + Up in visual mode

-- Move selected lines down with Alt + Down in visual block mode
keymap.set('x', '<A-Down>', ':m \'>+1<CR>gv=gv', { desc = 'Move selected block down', noremap = true, silent = true })

-- Move selected lines up with Alt + Up in visual block mode
keymap.set('x', '<A-Up>', ':m \'<-2<CR>gv=gv', { desc = 'Move selected block up', noremap = true, silent = true })

-- Restore Session
keymap.set('n', '<leader>sr', '<cmd>SessionRestore<CR>', { desc = 'Restore Session', noremap = true, silent = true })
keymap.set('n', '<leader>ss', '<cmd>SessionSave<CR>', { desc = 'Save Session', noremap = true, silent = true })


-- Code Runner 

keymap.set('n', '<F7>', '<cmd>RunCode<CR>', { desc = 'Run Code ', noremap = true, silent = true })
