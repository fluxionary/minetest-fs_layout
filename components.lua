

function fs_layout.container(...)
	return { type = "container", ... }
end

function fs_layout.scroll_container(...)
	return { type = "scroll_container", ... }
end

function fs_layout.list(inventory_location, list_name, w, h, starting_item_index)
	return {
		type = "list",
		inventory_location = inventory_location,
		list_name = list_name,
		w = w,
		h = h,
		starting_item_index = starting_item_index
	}
end

function fs_layout.listring(inventory_location, list_name)
	return {
		type = "listring",
		inventory_location = inventory_location,
		list_name = list_name
	}
end

function fs_layout.listcolors(slot_bg_normal, slot_bg_hover, slot_border, tooltip_bgcolor, tooltip_fontcolor)
	return {
		type = "listcolors",
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
		gui_element_name = gui_element_name,
		tooltip_text = tooltip_text,
		bgcolor = bgcolor,
		fontcolor = fontcolor
	}
end

function fs_layout.image(w, h, texture_name)
	return {
		type = "image",
		w = w,
		h = h,
		texture_name = texture_name
	}
end

function fs_layout.animated_image(w, h, name, texture, frame_count, frame_duration, frame_start)
	return format_xy(("animated_image[%%f,%%f;%f,%f;%s;%s;%i;%f;%s]"):format(
		w, h, F(name), F(texture), frame_count, frame_duration, frame_start or ""
	))
end

local function parse_textures(textures)
	if type(textures) == "string" then
		textures = string.split(textures)
	end

	local parsed_bits = {}
	for _, texture in ipairs(textures) do
		table.insert(parsed_bits, F(texture))
	end

	return table.concat(parsed_bits, ",")
end

function fs_layout.model(w, h, name, mesh, textures, rx, ry, continuous, mouse_control, fl_start, fl_stop, speed)
	return format_xy(("model[%%f,%%f;%f,%f;%s;%s;%s;%s;%s;%s;%s;%s]"):format(
		w, h, F(name), F(mesh), parse_textures(textures), (rx and ry) and ("%f,%f"):format(rx, ry) or "",
		continuous or false, mouse_control or true,
		(fl_start and fl_stop) and ("%i,%i"):format(fl_start, fl_stop) or "", speed or ""
	))
end

function fs_layout.item_image(w, h, item_name)
	return format_xy(("item_image[%%f,%%f;%f,%f;<item name>]"):format(
		w, h, F(item_name)
	))
end

function fs_layout.bgcolor(bgcolor, fullscreen, fbgcolor)
	return ("bgcolor[%s;%s;%s]"):format(
		bgcolor, fullscreen or "", fbgcolor or ""
	)
end

function fs_layout.pwdfield(w, h, name, label)
	return format_xy(("pwdfield[%%f,%%f;%f,%f;%s;%s]"):format(
		w, h, F(name), F(label)
	))
end

function fs_layout.field(w, h, name, label, default)
	return format_xy(("field[%%f,%%f;%f,%f;%s;%s;%s]"):format(
		w, h, F(name), F(label), F(default or "")
	))
end

function fs_layout.field(w, h, name, label, default)
	return format_xy(("field[%%f,%%f;%f,%f;%s;%s;%s]"):format(
		w, h, F(name), F(label), F(default or "")
	))
end

function fs_layout.field_close_on_enter(name, close_on_enter)
	return ("field_close_on_enter[%s;%s]"):format(
		F(name), close_on_enter or ""
	)
end

function fs_layout.textarea(w, h, name, label, default)
	return format_xy(("textarea[%%f,%%f;%f,%f;%s;%s;%s]"):format(
		w, h, F(name), F(label), F(default or "")
	))
end

function fs_layout.label(w, h, label)
	return format_xy(("label[%%f,%%f;%f,%f;%s]"):format(
		w, h, F(label)
	))
end

function fs_layout.hypertext(w, h, name, text)
	return format_xy(("hypertext[%%f,%%f;%f,%f;%s;%s]"):format(
		w, h, F(name), F(text)
	))
end

function fs_layout.vertlabel(label)
	return format_xy(("vertlabel[%%f,%%f;%s]"):format(
		F(label)
	))
end

function fs_layout.button(w, h, name, label)
	return format_xy(("button[%%f,%%f;%f,%f;%s;%s]"):format(
		w, h, F(name), F(label)
	))
end

function fs_layout.image_button(w, h, texture, name, label, noclip, drawborder, pressed_texture)
	return format_xy(("image_button[%%f,%%f;%f,%f;%s;%s;%s;%s;%s]"):format(
		w, h, F(texture), F(name), F(label), noclip or "", drawborder or "", F(pressed_texture)
	))
end

function fs_layout.item_image_button(w, h, item, name, label)
	return format_xy(("item_image_button[%%f,%%f;%f,%f;%s;%s;%s]"):format(
		w, h, F(item), F(name), F(label)
	))
end

function fs_layout.button_exit(w, h, name, label)
	return format_xy(("button_exit[%%f,%%f;%f,%f;%s;%s]"):format(
		w, h, F(name), F(label)
	))
end

function fs_layout.image_button_exit(w, h, texture, name, label)
	return format_xy(("image_button_exit[%%f,%%f;%f,%f;<texture name>;<name>;<label>]"):format(
		w, h, F(texture), F(name), F(label)
	))
end

function fs_layout.textlist(w, h, name, listelems, selected_idx, transparent)
	for i = 1, #listelems do
		listelems[i] = F(listelems[i])
	end

	return format_xy(("textlist[%%f,%%f;%f,%f;%s;%s;%i;%s]"):format(
		w, h, name, table.concat(listelems, ","), selected_idx or 1, transparent or ""
	))
end

function fs_layout.tabheader(w, h, name, captions, current_tab, transparent, draw_border)
	for i = 1, #captions do
		captions[i] = F(captions[i])
	end

	if w and h then
		return format_xy(("tabheader[%%f,%%f;%f,%f;%s;%s;%s;%s;%s]"):format(
			w, h, F(name), table.concat(captions, ","), current_tab, transparent or "", draw_border or ""
		))

	elseif h then
		return format_xy(("tabheader[%%f,%%f;%f;%s;%s;%s;%s;%s]"):format(
			h, F(name), table.concat(captions, ","), current_tab, transparent or "", draw_border or ""
		))

	else
		return format_xy(("tabheader[%%f,%%f;%s;%s;%s;%s;%s]"):format(
			F(name), table.concat(captions, ","), current_tab, transparent or "", draw_border or ""
		))
	end
end

function fs_layout.box(w, h, color)
	return format_xy(("box[%%f,%%f;%f,%f;%s]"):format(
		w, h, color
	))
end

function fs_layout.dropdown(w, h, name, items, selected_idx, index_event)
	for i = 1, #items do
		items[i] = F(items[i])
	end

	if h then
		return format_xy(("dropdown[%%f,%%f;%f,%f;%s;%s;%i;%s]"):format(
			w, h, F(name), table.concat(items, ","), selected_idx, index_event or ""
		))

	else
		return format_xy(("dropdown[%%f,%%f;%f;%s;%s;%i;%s]"):format(
			w, F(name), table.concat(items, ","), selected_idx, index_event or ""
		))
	end
end

function fs_layout.checkbox(name, label, selected)
	return format_xy(("checkbox[%%f,%%f;%s;%s;%s]"):format(
		F(name), F(label), selected or ""
	))
end

function fs_layout.scrollbar(orientation, name, value)
	return format_xy(("scrollbar[%%f,%%f;%f,%f;%s;%s;%f]"):format(
		orientation or "", F(name), value or 0
	))
end

function fs_layout.scrollbaroptions(options)
	local parts = {}

	for key, value in pairs(options) do
		table.insert(parts, ("%s=%s"):format(key, value))
	end

	return ("scrollbaroptions[%s]"):format(table.concat(parts, ";"))
end

function fs_layout.table(w, h, name, cells, selected_idx)
	for i = 1, #cells do
		cells[i] = F(cells[i])
	end

	return format_xy(("table[%%f,%%f;%f,%f;%s;%s;%i]"):format(
		w, h, F(name), table.concat(cells, ","), selected_idx or 0
	))
end

function fs_layout.tableoptions(options)
	local parts = {}

	for key, value in pairs(options) do
		table.insert(parts, ("%s=%s"):format(key, value))
	end

	return ("tableoptions[%s]"):format(table.concat(parts, ";"))
end

function fs_layout.tablecolumns(columndefs)
	local columns = {}
	for _, columndef in ipairs(columndefs) do
		local options = {columndefs.type}
		for k, v in pairs(columndef) do
			if k ~= "type" then
				table.insert(options, ("%s=%s"):format(k, v))
			end
		end
		table.insert(columns, table.concat(options, ","))
	end

	return ("tablecolumns[<type 1>,<opt 1a>,<opt 1b>,...;<type 2>,<opt 2a>,<opt 2b>;...]")
end

function fs_layout.style(selectors, props)
	return ("style[%s;%s]"):format(
		table.concat(selectors or {}, ","),
		table.concat(props or {}, ";")
	)
end

function fs_layout.style_type(selectors, props)
	return ("style_type[%s;%s]"):format(
		table.concat(selectors or {}, ","),
		table.concat(props or {}, ";")
	)
end

function fs_layout.set_focus(name, force)
	return ("set_focus[%s;%s"):format(F(name), force or "")
end
