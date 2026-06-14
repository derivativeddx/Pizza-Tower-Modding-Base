if (picked == false && pickable == true)
{
	hsp = 0;
	vsp = 0;
	grav = 0;
	alarm[0] = 150;
	y = obj_player.y - 50;
	x = obj_player.x;
	with (obj_player)
	{
		state = states.gottreasure;
		fmod_event_one_shot("event:/sfx/misc/secretfound");
		global.giantkey = true;
	}
	obj_tv.showtext = true;
	obj_tv.message = "GOT THE GIANT KEY!!!";
	obj_tv.alarm[0] = 200;
	global.heattime = 60;
	picked = true;
}
