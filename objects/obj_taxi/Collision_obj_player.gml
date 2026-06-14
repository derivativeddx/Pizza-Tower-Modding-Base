with (other)
{
	if (key_up && grounded && ((state == states.ratmount && brick) || state == states.normal || state == states.mach1 || state == states.mach2 || state == states.pogo || state == states.mach3 || state == states.Sjumpprep) && !instance_exists(obj_taxidud) && !instance_exists(obj_fadeout) && state != states.taxi)
	{
		instance_create(x, y, obj_genericpoofeffect);
		visible = false;
		sprite_index = spr_idle;
		hsp = 0;
		movespeed = 0;
		ratmount_movespeed = 0;
		vsp = 0;
		state = states.taxi;
		fmod_event_one_shot("event:/sfx/misc/taximove");
		other.playerid = obj_player;
		other.move = true;
		other.sprite_index = spr_taximove;
		other.hsp = 10;
		cutscene = true;
		other.depth = -100;
		with (obj_hamkuffattack)
		{
			if (state == 0)
			{
				instance_destroy();
			}
		}
		if (police)
		{
			with (instance_create(x, y, obj_taxicardboard))
			{
				depth = -101;
			}
			fmod_event_one_shot("event:/sfx/misc/policesiren");
			other.police_buffer = 50;
			policetaxi = true;
			other.sprite_index = spr_taxicop;
		}
	}
}
