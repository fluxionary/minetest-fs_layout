std = "lua51+luajit+minetest+fs_layout"
unused_args = false
max_line_length = 120

stds.minetest = {
	read_globals = {
		"DIR_DELIM",
		"minetest",
		"core",
		"dump",
		"vector",
		"nodeupdate",
		"VoxelManip",
		"VoxelArea",
		"PseudoRandom",
		"ItemStack",
		"default",
		"table",
		"math",
		"string",
	}
}

stds.fs_layout = {
	globals = {
		"fs_layout",
	},
	read_globals = {
	    "formspec_ast",
	},
}
