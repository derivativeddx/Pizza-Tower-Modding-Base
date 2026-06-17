if (DEBUG)
{
	if (keyboard_check_pressed(vk_f2))
	{
		with (instance_create(0, 0, obj_cheftask))
		{
			achievement_spr = noone;
			sprite_index = spr_newclothes;
			paletteselect = 12;
			texture = spr_peppattern1;
		}
	}
	if (keyboard_check_pressed(vk_f5))
	{
		active = !active;
		keyboard_string = "";
	}
	if (active)
	{
		var _search = false;
		if (keyboard_check(vk_anykey) && !keyboard_check(vk_f5))
		{
			input_text += keyboard_string;
			keyboard_string = "";
			_search = true;
		}
		if (keyboard_check_pressed(vk_backspace))
		{
			input_text = string_delete(input_text, string_length(input_text), 1);
			_search = true;
		}
		if (keyboard_check_pressed(vk_enter))
		{
			DoCommand(input_text);
			input_text = "";
			keyboard_string = "";
			_search = true;
		}
		if (_search)
		{
			ds_list_clear(search_commands);
			search_w = 0;
			for (var i = 0; i < ds_list_size(command_list); i++)
			{
				var b = ds_list_find_value(command_list, i);
				var s = b.command_id;
				var d = string_split(input_text, " ");
				var t = d[0];
				if (string_copy(s, 1, string_length(t)) == t)
				{
					var txt = concat(b.command_id, " ", b.format, " - ", b.description);
					ds_list_add(search_commands, txt);
					var w = string_width(txt);
					if (w > search_w)
					{
						search_w = w;
					}
				}
			}
		}
	}
}