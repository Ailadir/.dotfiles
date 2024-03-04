local function header()
	return {
		"               ▄▄██████████▄▄               ",
		"               ▀▀▀   ██   ▀▀▀               ",
		"       ▄██▄   ▄▄████████████▄▄   ▄██▄       ",
		"     ▄███▀  ▄████▀▀▀    ▀▀▀████▄  ▀███▄     ",
		"     ████▄ ▄███▀              ▀███▄ ▄████   ",
		"   ███▀█████▀▄████▄      ▄████▄▀█████▀███   ",
		"   ██▀  ███▀ ██████      ██████ ▀███  ▀██   ",
		"    ▀  ▄██▀  ▀████▀  ▄▄  ▀████▀  ▀██▄  ▀    ",
		"       ███           ▀▀           ███       ",
		"       ██████████████████████████████       ",
		"   ▄█  ▀██  ███   ██    ██   ███  ██▀  █▄   ",
		"   ███  ███ ███   ██    ██   ███▄███  ███   ",
		"   ▀██▄████████   ██    ██   ████████▄██▀   ",
		"    ▀███▀ ▀████   ██    ██   ████▀ ▀███▀    ",
		"     ▀███▄  ▀███████    ███████▀  ▄███▀     ",
		"       ▀███    ▀▀██████████▀▀▀   ███▀       ",
		"         ▀    ▄▄▄    ██    ▄▄▄    ▀         ",
		"               ▀████████████▀               ",
	}
end
local M = {}

-- Path to overriding theme and highlights files
-- local highlights = require("custom.highlights")

M.ui = {
	-- tabufline = {
	-- 	enabled = false,
	-- },
	--

	nvdash = {
		load_on_startup = true,
		header = header(),
		buttons = {
			{ "", " ", "" },

			{ "while(noSuccess)", " ", "" },
			{ "       try again()", " ", "" },
			{ "               if (success) ", " ", "" },
			{ "                      improve()", " ", "" },
			{ "", " ", "" },

			{ "If you don’t take risks,", " ", "" },
			{ "                  you can’t create a future", "", "" },
		},
	},
	-- theme = "tokyonight",
	--   theme_toggle = { "catppuccin", "one_light" },
	--
	-- hl_override = highlights.override,
	-- hl_add = highlights.add,
}
M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require("custom.mappings")

return M
