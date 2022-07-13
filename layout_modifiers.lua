
function fs_layout.spacer(w)
	if not w then w = 1 end
	return {
		_meta = "offset",
		_offset_x = w,
	}
end

function fs_layout.line_break(h)
	if not h then h = 1 end
	return {
		_meta = "offset",
		_reset_x = true,
		_offset_y = h,
	}
end

function fs_layout.offset(x, y)
	return {
		_meta = "offset",
		_offset_x = x,
		_offset_y = y,
	}
end
