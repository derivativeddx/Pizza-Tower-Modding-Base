if (obj_player.state != states.backbreaker && obj_player.state != states.parry)
{
	instance_destroy();
}
if (obj_player.parrytimer <= 0)
{
	instance_destroy();
}
image_xscale = obj_player.xscale;
x = obj_player.x;
y = obj_player.y;
