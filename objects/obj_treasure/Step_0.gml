if (!got)
{
	if (obj_player.state != states.gottreasure)
	{
		y = Wave(ystart - 5, ystart + 5, 2, 2);
	}
	
	if (place_meeting(x, y, obj_player))
	{
		with (obj_player)
		{
			treasure_x = x;
			treasure_y = y;
			treasure_room = room;
			ds_list_add(global.saveroom, other.id);
			global.treasure = true;
			global.combotime = 60;
			hsp = 0;
			vsp = 0;
			other.alarm[0] = 150;
			state = states.gottreasure;
			fmod_event_one_shot("event:/sfx/misc/foundtreasure");
			other.got = true;
			other.x = x - 18;
			other.y = y - 35;
			other.effectid = instance_create(other.x + 18, other.y, obj_treasureeffect);
			other.vsp = 0;
			other.depth = -20;
			other.player = 1;
		}
	}
}
