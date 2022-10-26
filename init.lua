local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)
local S = minetest.get_translator(modname)

fs_layout = {
	version = os.time({year = 2022, month = 10, day = 26}),
	fork = "fluxionary",

	modname = modname,
	modpath = modpath,

	S = S,

	has = {
	},

	log = function(level, messagefmt, ...)
		return minetest.log(level, ("[%s] %s"):format(modname, messagefmt:format(...)))
	end,

	dofile = function(...)
		return dofile(table.concat({modpath, ...}, DIR_DELIM) .. ".lua")
	end,
}

fs_layout.dofile("layout_modifiers")
fs_layout.dofile("components")
fs_layout.dofile("composition")
