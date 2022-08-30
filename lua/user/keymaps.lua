local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
local term_opts = { silent = true }

-- Remap space as leader key
keymap("","<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal Mode
-- Better window navigation for split view
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- oo to add newline without entering insert mode
keymap("n", "<leader>o", "o<ESC>", opts)
keymap("n", "<leader>O", "O<ESC>", opts)


-- Resize panes with arrow keys
-- TODO: Control arrows interfere with mission control on mac
keymap('n', '<C-Up>', ':resize +2<CR>', opts)
keymap('n', '<C-Down>', ':resize -2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Show file navigation pane
keymap('n', '<leader>e', ':NvimTreeToggle<cr>', opts) 

-- Navigate buffers
keymap('n', '<S-l>', ':bnext<CR>', opts)
keymap('n', '<S-h>', ':bprevious<CR>', opts)
keymap('n', '<S-q>', ':bd<CR>', opts)


-- Insert 
keymap('i', 'kj', '<ESC>', opts)
keymap('i', '<C-CR>', '<ESC>o', opts) -- Command Enter functionality
keymap('i', '<S-CR>', '<ESC>a ', opts) -- Command Enter functionality TODO: Still needs refinement to get desired functionality

-- Visual
--
-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

keymap("v", "p", '"_dP', opts) -- Remaps dd paste functionality to keep the original clipboard rather than the dd lingo


-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope
keymap("n", "<leader>f", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>t", ":Telescope live_grep<CR>", opts)

-- Toggle Term
keymap('n', '<leader>p', '<cmd>lua _PYTHON_TOGGLE()<CR>', opts) 
keymap("n", "<leader>g", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", {noremap = true, silent = true})

-- Remap :w to save
keymap('n', '<C-s>', '<ESC>:w<CR>', opts)
keymap('i', '<C-s>', '<ESC>:w<CR>', opts)


-- Hop
-- place this in one of your configuration file(s)
vim.api.nvim_set_keymap('', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>", {})
vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>", {})

keymap('n', '<leader><leader>l', ":HopAnywhereCurrentLine<cr>", opts)
keymap('n', '<leader><leader>v', ":HopLine<cr>", opts)
keymap('n', '<leader><leader>a', ":HopAnywhere<cr>", opts)
keymap('n', '<leader><leader>c', ":HopChar1<cr>", opts)
keymap('n', '<leader><leader>w', ":HopWord<cr>", opts)
keymap('n', '<leader><leader>/', ":HopPattern<cr>", opts)
