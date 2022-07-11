-- https://gitlab.com/luk3yx/minetest-formspec_ast

function fs_layout.calculate_positions(elements)
	elements = table.copy(elements)
	local x = 0
	local y = 0
	local width = 0
	for _, element in elements do
		if element._meta then
			if element._meta == "offset" then
				if element._reset_x then
					width = math.max(x, width)
					x = 0
				else
					x = x + (element._offset_x or 0)
				end
				y = y + (element._offset_y or 0)
			else
				error(("don't understand how to %s"):format(element._meta))
			end

		elseif element.xy then
			element.xy = nil
			element.x = x
			element.y = y
			if element.type == "container" or element.type == "scroll_container" then
				local container_w, _ = fs_layout.calculate_positions(element)
				x = x + container_w
			else
				x = x + element.w
			end
		end
	end

	-- remove meta elements
	for i = #elements, 1, -1 do
		if elements[i]._meta then
			table.remove(elements, i)
		end
	end

	return math.max(width, x), y
end

function fs_layout.compose(elements)
	local width, height = fs_layout.calculate_positions(elements)
	if elements[1].type ~= "size" then
		table.insert(elements, 1, fs_layout.size(width, height))
	end

	return formspec_ast.unparse(elements)
end
