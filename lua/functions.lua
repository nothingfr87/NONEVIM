local Terminal = require("toggleterm.terminal").Terminal

-- Gitsigns
function git_add()
	Terminal:new({
		cmd = "git add .",
		direction = "float",
		size = 3,
		close_on_exit = true,
	}):toggle()
end

function git_commit()
	Terminal:new({
		cmd = "git commit",
		direction = "float",
		size = 3,
		close_on_exit = true,
	}):toggle()
end

-- LSP Diagnostics
_G.lsp_diagnostics = function()
	local e = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
	local w = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
	local err = (e > 0) and (" " .. e .. "   ") or ""
	local warn = (w > 0) and (" " .. w .. " ") or ""
	return err .. warn
end

-- Bufferline
function _G.buffer_tabline()
	local s = ""
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.bo[buf].buflisted then
			local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")
			if name == "" then
				name = "[No Name]"
			end
			if buf == vim.api.nvim_get_current_buf() then
				s = s .. "%#TabLineSel#"
			else
				s = s .. "%#TabLine#"
			end
			s = s .. " " .. name .. " "
		end
	end
	return s .. "%#TabLineFill#"
end

-- FZF
function open_file()
	Terminal:new({
		cmd = "fd --type f | fzf --preview='cat {1}' > /tmp/selected",
		direction = "horizontal",
		size = 10,
		on_exit = function()
			local file = vim.fn.readfile("/tmp/selected")[1]
			if file and file ~= "" then
				vim.schedule(function()
					vim.cmd("edit " .. vim.fn.fnameescape(file))
				end)
			end
			os.remove("/tmp/selected")
		end,
	}):toggle()
end

function create_file()
	vim.ui.input({ prompt = "Filename: " }, function(input)
		if input and input ~= "" then
			vim.cmd("edit " .. vim.fn.fnameescape(input))
		end
	end)
	os.remove("/tmp/selected")
end

function delete_file()
	Terminal:new({
		cmd = "fd --type f | fzf --preview='cat {1}' > /tmp/selected",
		direction = "horizontal",
		size = 10,
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
