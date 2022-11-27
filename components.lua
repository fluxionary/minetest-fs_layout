function fs_layout.size(w, h, fixed_size)
	return {
		type = "size",
		xy = false,
		w = w,
		h = h,
		fixed_size = fixed_size,
	}
end

function fs_layout.position(x, y)
	return {
		type = "anchor",
		xy = false,
		x = x,
		y = y,
	}
end

function fs_layout.anchor(x, y)
	return {
		type = "anchor",
		xy = false,
		x = x,
		y = y,
	}
end

function fs_layout.padding(x, y)
	return {
		type = "padding",
		xy = false,
		x = x,
		y = y,
	}
end

function fs_layout.no_prepend()
	return {
		type = "no_prepend",
		xy = false,
	}
end

function fs_layout.real_coordinates(bool)
	return {
		type = "real_coordinates",
		xy = false,
		bool = bool,
	}
end

function fs_layout.container(...)
	return {
		type = "container",
		xy = true,
		...,
	}
end

function fs_layout.scroll_container(...)
	return {
		type = "scroll_container",
		xy = true,
		...,
	}
end

function fs_layout.list(inventory_location, list_name, w, h, starting_item_index)
	return {
		type = "list",
		xy = true,
		inventory_location = inventory_location,
		list_name = list_name,
		w = w,
		h = h,
		starting_item_index = starting_item_index,
	}
end

function fs_layout.listring(inventory_location, list_name)
	return {
		type = "listring",
		xy = false,
		inventory_location = inventory_location,
		list_name = list_name,
	}
end

function fs_layout.listcolors(slot_bg_normal, slot_bg_hover, slot_border, tooltip_bgcolor, tooltip_fontcolor)
	return {
		type = "listcolors",
		xy = false,
		slot_bg_normal = slot_bg_normal,
		slot_bg_hover = slot_bg_hover,
		slot_border = slot_border,
		tooltip_bgcolor = tooltip_bgcolor,
		tooltip_fontcolor = tooltip_fontcolor,
	}
end

function fs_layout.tooltip(gui_element_name, tooltip_text, bgcolor, fontcolor)
	return {
		type = "tooltip",
		xy = false,
		gui_element_name = gui_element_name,
		tooltip_text = tooltip_text,
		bgcolor = bgcolor,
		fontcolor = fontcolor,
	}
end

function fs_layout.image(w, h, texture_name)
	return {
		type = "image",
		xy = true,
		w = w,
		h = h,
		texture_name = texture_name,
	}
end

function fs_layout.animated_image(w, h, name, texture_name, frame_count, frame_duration, frame_start)
	return {
		type = "animated_image",
		xy = true,
		w = w,
		h = h,
		name = name,
		texture_name = texture_name,
		frame_count = frame_count,
		frame_duration = frame_duration,
		frame_start = frame_start,
	}
end

local function process_textures(textures)
	if type(textures) == "string" then
		return string.split(textures)
	end

	return textures
end

function fs_layout.model(w, h, name, mesh, textures, rx, ry, continuous, mouse_control, fl_start, fl_stop, speed)
	return {
		type = "model",
		xy = true,
		w = w,
		h = h,
		name = name,
		mesh = mesh,
		textures = process_textures(textures),
		rotation_x = rx,
		rotation_y = ry,
		continuous = continuous,
		mouse_control = mouse_control,
		frame_loop_begin = fl_start,
		frame_loop_end = fl_stop,
		animation_speed = speed,
	}
end

function fs_layout.item_image(w, h, item_name)
	return {
		type = "item_image",
		xy = true,
		w = w,
		h = h,
		item_name = item_name,
	}
end

function fs_layout.bgcolor(bgcolor, fullscreen, fbgcolor)
	return {
		type = "bgcolor",
		xy = false,
		bgcolor = bgcolor,
		fullscreen = fullscreen,
		fbgcolor = fbgcolor,
	}
end

function fs_layout.background(w, h, texture_name, auto_clip)
	return {
		type = "background",
		xy = true,
		w = w,
		h = h,
		texture_name = texture_name,
		auto_clip = auto_clip,
	}
end

function fs_layout.background9(w, h, texture_name, auto_clip, middle_x, middle_y, middle_x2, middle_y2)
	return {
		type = "background9",
		xy = true,
		w = w,
		h = h,
		texture_name = texture_name,
		auto_clip = auto_clip,
		middle_x = middle_x,
		middle_y = middle_y,
		middle_x2 = middle_x2,
		middle_y2 = middle_y2,
	}
end

function fs_layout.pwdfield(w, h, name, label)
	return {
		type = "pwdfield",
		xy = true,
		w = w,
		h = h,
		name = name,
		label = label,
	}
end

function fs_layout.field(w, h, name, label, default)
	return {
		type = "field",
		xy = true,
		w = w,
		h = h,
		name = name,
		label = label,
		default = default,
	}
end

function fs_layout.field_close_on_enter(name, close_on_enter)
	return {
		type = "field_close_on_enter",
		xy = false,
		name = name,
		close_on_enter = close_on_enter,
	}
end

function fs_layout.textarea(w, h, name, label, default)
	return {
		type = "textarea",
		xy = true,
		w = w,
		h = h,
		name = name,
		label = label,
		default = default,
	}
end

function fs_layout.label(label)
	return {
		type = "label",
		xy = true,
		label = label,
	}
end

function fs_layout.hypertext(w, h, name, text)
	return {
		type = "hypertext",
		xy = true,
		w = w,
		h = h,
		name = name,
		text = text,
	}
end

function fs_layout.vertlabel(label)
	return {
		type = "vertlabel",
		xy = true,
		label = label,
	}
end

function fs_layout.button(w, h, name, label)
	return {
		type = "button",
		xy = true,
		w = w,
		h = h,
		name = name,
		label = label,
	}
end

function fs_layout.image_button(w, h, texture_name, name, label, noclip, drawborder, pressed_texture_name)
	return {
		type = "image_button",
		xy = true,
		w = w,
		h = h,
		texture_name = texture_name,
		name = name,
		label = label,
		noclip = noclip,
		drawborder = drawborder,
		pressed_texture_name = pressed_texture_name,
	}
end

function fs_layout.item_image_button(w, h, item_name, name, label)
	return {
		type = "item_image_button",
		xy = true,
		w = w,
		h = h,
		item_name = item_name,
		name = name,
		label = label,
	}
end

function fs_layout.button_exit(w, h, name, label)
	return {
		type = "button_exit",
		xy = true,
		w = w,
		h = h,
		name = name,
		label = label,
	}
end

function fs_layout.image_button_exit(w, h, texture_name, name, label)
	return {
		type = "image_button_exit",
		xy = true,
		w = w,
		h = h,
		texture_name = texture_name,
		name = name,
		label = label,
	}
end

function fs_layout.textlist(w, h, name, listelems, selected_idx, transparent)
	return {
		type = "textlist",
		xy = true,
		w = w,
		h = h,
		listelems = listelems,
		selected_idx = selected_idx,
		transparent = transparent,
	}
end

function fs_layout.tabheader(w, h, name, captions, current_tab, transparent, draw_border)
	return {
		type = "tabheader",
		xy = true,
		w = w,
		h = h,
		name = name,
		captions = captions,
		current_tab = current_tab,
		transparent = transparent,
		draw_border = draw_border,
	}
end

function fs_layout.box(w, h, color)
	return {
		type = "box",
		xy = true,
		w = w,
		h = h,
		color = color,
	}
end

function fs_layout.dropdown(w, h, name, items, selected_idx, index_event)
	return {
		type = "dropdown",
		xy = true,
		w = w,
		h = h,
		name = name,
		items = items,
		selected_idx = selected_idx,
		index_event = index_event,
	}
end

function fs_layout.checkbox(name, label, selected)
	return {
		type = "checkbox",
		xy = true,
		name = name,
		label = label,
		selected = selected,
	}
end

function fs_layout.scrollbar(w, h, orientation, name, value)
	return {
		type = "scrollbar",
		xy = true,
		w = w,
		h = h,
		orientation = orientation,
		name = name,
		value = value,
	}
end

function fs_layout.scrollbaroptions(opts)
	return {
		type = "scrollbaroptions",
		xy = false,
		opts = opts,
	}
end

function fs_layout.table(w, h, name, cells, selected_idx)
	return {
		type = "table",
		xy = true,
		w = w,
		h = h,
		name = name,
		cells = cells,
		selected_idx = selected_idx,
	}
end

function fs_layout.tableoptions(opts)
	return {
		type = "tableoptions",
		xy = false,
		opts = opts,
	}
end

function fs_layout.tablecolumns(columndefs)
	return {
		type = "tablecolumns",
		xy = false,
		tablecolumns = columndefs,
	}
end

function fs_layout.style(selectors, props)
	return {
		type = "style",
		xy = false,
		selectors = selectors,
		props = props,
	}
end

function fs_layout.style_type(selectors, props)
	return {
		type = "style_type",
		xy = false,
		selectors = selectors,
		props = props,
	}
end

function fs_layout.set_focus(name, force)
	return {
		type = "set_focus",
		xy = false,
		name = name,
		force = force,
	}
end
