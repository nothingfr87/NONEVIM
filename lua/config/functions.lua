local Terminal = require("toggleterm.terminal").Terminal

-- Gitsigns
_G.git_add = function()
	Terminal:new({
		cmd = "git add .",
		direction = "float",
		size = 3,
		close_on_exit = true,
	}):toggle()
end

_G.git_commit = function()
	Terminal:new({
		cmd = "git commit",
		direction = "float",
		size = 3,
		close_on_exit = true,
	}):toggle()
end

-- FZF
_G.open_file = function()
	vim.api.nvim_set_hl(0, "OpenTitle", { fg = "#a6e3a1", bg = "#11111b", bold = true })

	Terminal
		:new({
			cmd = "fd --type f | fzf --preview='cat --color=always {1}' > /tmp/selected",
			direction = "float",
			border = "rounded",
			size = 10,
			on_open = function(t)
				vim.api.nvim_win_set_config(t.window, { title = "Select a file to open.", title_pos = "center" })
				vim.wo[t.window].winhighlight = "FloatTitle:OpenTitle"
			end,
			on_exit = function()
				local file = vim.fn.readfile("/tmp/selected")[1]
				if file and file ~= "" then
					vim.schedule(function()
						vim.cmd("edit " .. vim.fn.fnameescape(file))
					end)
				end
				os.remove("/tmp/selected")
			end,
		})
		:toggle()
end

_G.create_file = function()
	vim.ui.input({ prompt = "Filename: " }, function(input)
		if input and input ~= "" then
			vim.cmd("edit " .. vim.fn.fnameescape(input))
		end
	end)
	os.remove("/tmp/selected")
end

_G.delete_file = function()
	vim.api.nvim_set_hl(0, "DelTitle", { fg = "#f38ba8", bg = "#11111b", bold = true })

	Terminal:new({
		cmd = "fd --type f | fzf --preview='cat --color=always {1}' > /tmp/selected",
		direction = "float",
		size = 10,
		on_open = function(t)
			vim.api.nvim_win_set_config(
				t.window,
				{ title = "Select a file to delete. (CAREFUL! YOU CANNOT UNDO THIS!)", title_pos = "center" }
			)
			vim.wo[t.window].winhighlight = "FloatTitle:DelTitle"
		end,
		on_exit = function()
			local file = vim.fn.readfile("/tmp/selected")[1]
			if file then
				local answer = vim.fn.confirm("Delete" .. file .. "?", "&Yes\n&No", 2)
				if answer == 1 then
					os.remove(file)
				end
			end
			os.remove("/tmp/selected")
		end,
	}):toggle()
end
