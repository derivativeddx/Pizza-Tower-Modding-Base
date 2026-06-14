if (obj_player1.state != states.backbreaker && obj_player1.state != states.parry)
{
	instance_destroy();
}
if (obj_player1.parrytimer <= 0)
{
	instance_destroy();
}
image_xscale = obj_player1.xscale;
x = obj_player1.x;
y = obj_player1.y;
