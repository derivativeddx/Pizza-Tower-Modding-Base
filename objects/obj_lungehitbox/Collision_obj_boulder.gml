if (other.state != states.grabbed && playerid.state != states.grab)
{
	other.state = states.grabbed;
	with (playerid)
	{
		state = states.grab;
		baddiegrabbedID = other.id;
		grabbingenemy = true;
		movespeed = 0;
		image_index = 0;
		sprite_index = spr_haulingstart;
	}
}
