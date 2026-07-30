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
