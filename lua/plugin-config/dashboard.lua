local status, db = pcall(require, "dashboard")
if not status then
	vim.notify("没有找到 dashboard")
	return
end

db.setup({
	theme = "doom",
	config = {
		footer = {
			"",
			"",
			"https://github.com/kaho-lc",
		},

		center = {
			{
				icon = "                     ",
				icon_hl = "title",
				desc = "Find file                           ",
				desc_hl = "string",
				action = "Telescope find_files",
			},
			{
				icon = "                     ",
				icon_hl = "title",
				desc = "Find text                           ",
				desc_hl = "string",
				action = "Telescope live_grep",
			},
			{
				icon = "                     ",
				desc = "Projects                            ",
				icon_hl = "title",
				desc_hl = "string",
				action = "Telescope projects",
			},
			{
				icon = "                     ",
				desc = "Recently files                      ",
				icon_hl = "title",
				desc_hl = "string",
				action = "Telescope oldfiles",
			},
			{
				icon = "                     ",
				icon_hl = "title",
				desc = "Edit keybindings                    ",
				desc_hl = "string",
				action = "edit ~/AppData/local/nvim/lua/keybindings.lua",
			},
			{
				icon = "                     ",
				icon_hl = "title",
				desc = "Edit init.lua                       ",
				desc_hl = "string",
				action = "edit ~/AppData/local/nvim/init.lua",
			},
		},
		header = {
			[[]],
			[[ ____  _ _   _            ]],
			[[| __ )(_) |_| |_ ___ _ __ ]],
			[[|  _ \| | __| __/ _ \ '__|]],
			[[| |_) | | |_| ||  __/ |   ]],
			[[|____/|_|\__|\__\___|_|   ]],
			[[                                                   ]],
			[[                [ version : 1.0.0 ]                ]],
			[[                                                   ]],
			[[                                                   ]],
		},
	},
})
