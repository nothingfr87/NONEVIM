require("functions")

local set = vim.keymap.set

-- Toggle Term
set("n", "<C-t>", ":ToggleTerm<CR>", { desc = "Toggle Term" })

-- Render Markdown
set("n", "<leader>md", ":RenderMarkdown toggle<CR>", { desc = "Toggle Render Markdown" })

-- BufferLine
set("n", "<Tab>", ":bnext<CR>", { desc = "Cycle Through Tabs" })
set("n", "<S-Tab>", ":bprev<CR>", { desc = "Cycle Through Previuos Tabs" })
set("n", "<leader>w", ":bdelete<CR>", { desc = "Delete Current Tab" })

-- Git signs
set("n", "<leader>gw", ":Gitsigns toggle_linehl<CR>", { desc = "Toggle Git Line Diff" })
set("n", "<leader>gd", ":Gitsigns toggle_deleted<CR>", { desc = "Toggle Git Line Deleted" })
set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle Git Line Blame" })
set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", { desc = "Preview Git Hunk" })
set("n", "<leader>gs", git_commit, { desc = "Git Commit" })
set("n", "<leader>ga", git_add, { desc = "Git Add" })

-- Live Server
set("n", "<leader>r", ":LiveServerToggle<CR>", { desc = "Toggle Live Server" })

-- Global Mappings

-- Splitting
set("n", "<leader>ts", ":split<CR>", { desc = "Split Neovim Window Horizantly" })
set("n", "<leader>tv", ":vsplit<CR>", { desc = "Split Neovim Window Vertically" })

-- Quiting
set("n", "<C-q>", ":q!<CR>", { desc = "Close Window" })

-- Toggle Inlay Hints
set(
	"n",
	"<leader><S-h>",
	":lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })<CR>",
	{ desc = "Enable Inlay Hints" }
)

-- Format Document
set("n", "<leader><S-f>", ":lua vim.lsp.buf.format()<CR>", { desc = "Format Current Document" })

-- Navigation
set("n", "<leader>h", "<C-w>h", { desc = "Go to left window" })
set("n", "<leader>j", "<C-w>j", { desc = "Go to lower window" })
set("n", "<leader>k", "<C-w>k", { desc = "Go to upper window" })
set("n", "<leader>l", "<C-w>l", { desc = "Go to right window" })

-- Resize windows
set("n", "<leader><", "<C-w><", { desc = "Decrease width" })
set("n", "<leader>>", "<C-w>>", { desc = "Increase width" })
set("n", "<leader>+", "<C-w>+", { desc = "Increase height" })
set("n", "<leader>-", "<C-w>-", { desc = "Decrease height" })

-- Go to Definition
set("n", "gd", ":lua vim.lsp.buf.definition()<CR>", { desc = "Go to Definition" })

-- Remap keybinds
set("t", "<Esc>", "<C-\\><C-n>", { desc = "Switch to normal mode in toggle term" })

-- FZF
vim.keymap.set("n", "<leader>e", open_file)

-- Create Files With FZF
vim.keymap.set("n", "<leader>a", create_file)

-- Delete Files With FZF
vim.keymap.set("n", "<C-d>", delete_file)
