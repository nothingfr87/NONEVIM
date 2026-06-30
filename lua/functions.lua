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

-- FZF
function open_file()
	Terminal:new({
		cmd = "fd --type f | fzf --preview='cat {1}' > /tmp/selected",
		direction = "float",
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
		direction = "float",
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

-- Bufferline
_G.get_buffer_icon = function(buf)
	local ok, icons = pcall(require, "nvim-web-devicons")
	if not ok then
		return ""
	end

	local path = vim.api.nvim_buf_get_name(buf)
	local name = vim.fn.fnamemodify(path, ":t")
	local ext = vim.fn.fnamemodify(path, ":e")

	local icon = icons.get_icon(name, ext, { default = true })
	return (icon or "") .. " "
end

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
			s = s .. " " .. _G.get_buffer_icon(buf) .. name .. " "
		end
	end
	return s .. "%#TabLineFill#"
end
