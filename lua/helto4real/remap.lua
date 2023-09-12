-- leader space makes sense
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


local keymap = vim.keymap --short

local map = function(mode, keys, func, desc)
    keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
end

-- Ok VIM purists will bash me for this...
vim.cmd('source ~/.config/nvim/lua/helto4real/remap.vim')

--setup keybindings for terminal
map("n", "<leader>tt", ":ToggleTerm size=50 direction=vertical<CR>", "Toggle [T]erminal")

-- Do not copy single character
keymap.set("n", "x", '"_x')
-- window splitting
map("n", "<leader>wv", "<C-w>v", "Split [W]indow [V]ertically")
map("n", "<leader>wh", "<C-w>s", "Split [W]indow horizontally")
map("n", "<leader>we", "<C-w>=", "[W]indow [=]equal width")
map("n", "<leader>wx", ":close<CR>", "[W]indow close")

map("n", "<leader>wm", ":MaximizerToggle<CR>", "[W]indow [M]aximize toggle")

-- move through windows
map("n", "<leader>wl", "<C-w><C-l>", "Move cursor to [W]indow Left");
map("n", "<leader>wj", "<C-w><C-h>", "Move cursor to [W]indow Right");
map("n", "<leader>wi", "<C-w><C-k>", "Move cursor to [W]indow up");
map("n", "<leader>wk", "<C-w><C-j>", "Move cursor to [W]indow left");

-- window tabbing

map("n", "<leader>tn", ":tabnew<CR>", "New [T]ab")     -- open new tab
map("n", "<leader>tx", ":tabclose<CR>", "Close [T]ab") -- close current tab
map("n", "<leader>tj", ":tabn<CR>", "Next [T]ab")      -- goto next tab
map("n", "<leader>tl", ":tabp<CR>", "Previous [T]ab")  -- goto previous tab

-- telescope maps
-- See `:help telescope.builtin`
map('n', '<leader>?', require('telescope.builtin').oldfiles, '[?] Find recently opened files')
map('n', '<leader><space>', require('telescope.builtin').buffers, '[ ] Find existing buffers')
map('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, '[/] Fuzzily search in current buffer')

map('n', '<leader>fg', require('telescope.builtin').git_files, 'Search [G]it [F]iles')
map('n', '<leader>ff', require('telescope.builtin').find_files, '[S]earch [F]iles')
map('n', '<leader>fh', require('telescope.builtin').help_tags, '[S]earch [H]elp')
map('n', '<leader>fw', require('telescope.builtin').grep_string, '[S]earch current [W]ord')
map('n', '<leader>fr', require('telescope.builtin').live_grep, '[S]earch by [G]rep')
map('n', '<leader>fd', require('telescope.builtin').diagnostics, '[S]earch [D]iagnostics')

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, 'Go to previous diagnostic message')
map('n', ']d', vim.diagnostic.goto_next, 'Go to next diagnostic message')
map('n', '<leader>e', vim.diagnostic.open_float, 'Open floating diagnostic message')
map('n', '<leader>q', vim.diagnostic.setloclist, 'Open diagnostics list')

-- nvim-tree keymaps
map("n", '<C-p>', ":NvimTreeFindFileToggle<CR>", "Toggle file tree")
-- smart moving and stuff
map("v", "K", ":m '>+1<CR>gv=gv", "Move line down")
map("v", "I", ":m '<-2<CR>gv=gv", "Move line up")
map("n", "J", "mzJ`z", "Merge line")
map("n", "<C-d>", "<C-d>zz", "Go half page down")
map("n", "<C-u>", "<C-u>zz", "Go half page up")
map("n", "n", "nzzzv", "Next search down")
map("n", "N", "Nzzzv", "Next search up")
-- Keep copy buffer intact in muliple paste
map("x", "<leader>p", [["_dP]])
-- next greatest remap ever : asbjornHaland
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])
-- makes ctr+c work like escape
map("i", "<C-c>", "<Esc>")

map("n", "Q", "<nop>")
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

map("n", "<leader>f", vim.lsp.buf.format)

-- smart replacing the current word
map("n", "<leader>vpp", "<cmd>e");

-- I know I miss those vscode c+s save thing
map("n", "<C-s>", "<cmd>w<CR>")
map("i", "<C-s>", "<Esc><cmd>w<CR>")

map("n", "<C-k><C-k>", "0<C-v><leader>gc")

map('t', '<esc>', [[<C-\><C-n>]])
map('t', 'jk', [[<C-\><C-n>]])
map('t', '<C-j>', [[<Cmd>wincmd h<CR>]])
map('t', '<C-k>', [[<Cmd>wincmd j<CR>]])
map('t', '<C-i>', [[<Cmd>wincmd k<CR>]])
map('t', '<C-l>', [[<Cmd>wincmd l<CR>]])
map('t', '<C-w>', [[<C-\><C-n><C-w>]])
