local set = vim.keymap.set

-- NeoTree
set("n", "<C-b>", ":Neotree toggle<CR>", { desc = "Toggle Neotree" })
set("n", "<leader>e", ":Neotree focus<CR>", { desc = "Focus Neotree" })

-- Telescope
set("n", "<C-f>", ":Telescope find_files<CR>", { desc = "Open telescope" })
set("n", "<C-g>", ":Telescope live_grep<CR>", { desc = "Search Words in Telescope" })

-- Toggle Term
set("n", "<C-t>", ":ToggleTerm<CR>", { desc = "Toggle Term" })

-- Code Runner
set("n", "<C-r>", ":RunCode<CR>", { desc = "Code Runner" })

-- UFO
set("n", "zR", require("ufo").openAllFolds)
set("n", "zM", require("ufo").closeAllFolds)

-- Bufferline
set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Cycle Through Tabs" })
set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Cycle Through Previuos Tabs" })
set("n", "<leader>w", ":BufferLinePickClose<CR>", { desc = "Pick a Tab to close" })
set("n", "<leader>p", ":BufferLinePick<CR>", { desc = "Pick a Tab to open" })
-- Git signs
set("n", "<leader>gw", ":Gitsigns toggle_linehl<CR>", { desc = "Toggle Git Line Diff" })
set("n", "<leader>gd", ":Gitsigns toggle_deleted<CR>", { desc = "Toggle Git Line Deleted" })
set("n", "<leader>gd", ":Gitsigns toggle_deleted<CR>", { desc = "Toggle Git Line Deleted" })
set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle Git Line Blame" })

-- Global Mappings
set("n", "<leader>ts", ":split<CR>", { desc = "Split Neovim Window Horizantly" })
set("n", "<leader>tv", ":vsplit<CR>", { desc = "Split Neovim Window Vertically" })
set("n", "<C-q>", ":q!<CR>", { desc = "Close Window" })
set(
	"n",
	"<leader>h",
	":lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })<CR>",
	{ desc = "Enable Inlay Hints" }
)
set("n", "<leader>f", ":lua vim.lsp.buf.format()<CR>", { desc = "Format Current Document" })

-- Remap keybinds
set("t", "<Esc>", "<C-\\><C-n>", { desc = "Switch to normal mode in toggle term" })
