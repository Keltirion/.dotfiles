local CustomTerminals = {}

local Terminal = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new {
	cmd = "lazygit",
	hidden = true,
	direction = "float",
}

function _Lazygit_Toggle()
	lazygit:toggle()
end

function CustomTerminals.lazygit()
	lazygit:toggle()
end

return CustomTerminals
