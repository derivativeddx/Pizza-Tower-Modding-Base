function scr_player_grabbed()
{
	if (fightball == false)
	{
		xscale = -obj_player1.xscale;
	}
	obj_player1.baddiegrabbedID = id;
	if (obj_player1.state == states.mach3 && fightball == true)
	{
		x = obj_player1.x;
		y = obj_player1.y;
	}
	if (obj_player1.state == states.grabbing || obj_player1.state == states.grab || obj_player1.state == states.throwing || obj_player1.state == states.slam || obj_player1.state == states.tacklecharge)
	{
		x = obj_player1.x;
		if (obj_player1.sprite_index != obj_player1.spr_haulingstart)
		{
			y = obj_player1.y - 40;
		}
		else if (floor(obj_player1.image_index) == 0)
		{
			y = obj_player1.y;
		}
		else if (floor(obj_player1.image_index) == 1)
		{
			y = obj_player1.y - 10;
		}
		else if (floor(obj_player1.image_index) == 2)
		{
			y = obj_player1.y - 20;
		}
		else if (floor(obj_player1.image_index) == 3)
		{
			y = obj_player1.y - 30;
		}
		xscale = -obj_player1.xscale;
	}
	with (obj_player1)
	{
		move = key_left2 + key_right2;
		if (key_slap && sprite_index == spr_grab)
		{
			global.hit += 1;
			if (other.object_index == obj_pizzaball)
			{
				global.golfhit += 1;
			}
			image_index = 0;
			sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4);
			instance_create(other.x, other.y, obj_slapstar);
			instance_create(other.x, other.y, obj_baddiegibs);
			other.flash = true;
			with (obj_camera)
			{
				shake_mag = 3;
				shake_mag_acc = 3 / room_speed;
			}
		}
		if (!(state == states.grab || (state == states.mach3 && fightball == true) || (state == states.ratmount || state == states.ratmountattack || state == states.ratmountjump || state == states.ratmountspit) || state == states.finishingblow || state == states.grabbing || state == states.throwing || state == states.slam || state == states.tacklecharge || state == states.punch || state == states.superslam || state == states.backkick || state == states.uppunch || state == states.shoulder))
		{
			baddiegrabbedID = obj_null;
			other.x = obj_player1.x;
			other.y = obj_player1.y;
			other.state = states.hurt;
			other.alarm[8] = 60;
			other.alarm[7] = 120;
			other.image_index = 0;
		}
	}
	if (obj_player1.state == states.ratmount || obj_player1.state == states.ratmountjump)
	{
		visible = false;
		x = obj_player1.x;
		y = obj_player1.y;
	}
	if (obj_player1.state == states.tacklecharge)
	{
		x = obj_player1.x + (obj_player1.xscale * 20);
		y = obj_player1.y;
	}
	if (obj_player1.state == states.finishingblow && obj_player1.image_index < 5)
	{
		x = obj_player1.x + (obj_player1.xscale * 60);
		y = obj_player1.y + 14;
	}
	if (place_meeting(x, y, obj_swordhitbox))
	{
		instance_create(x, y, obj_slapstar);
		instance_create(x, y, obj_slapstar);
		instance_create(x, y, obj_slapstar);
		instance_create(x, y, obj_baddiegibs);
		instance_create(x, y, obj_baddiegibs);
		instance_create(x, y, obj_baddiegibs);
		with (obj_camera)
		{
			shake_mag = 3;
			shake_mag_acc = 3 / room_speed;
		}
		state = states.hurt;
		if (scr_solid(x, y) || collision_line(x, y, obj_player1.x, obj_player1.y, obj_solid, false, true) != noone)
		{
			x = obj_player1.x;
			y = obj_player1.y;
		}
		other.alarm[8] = 60;
		other.alarm[7] = 120;
		with (obj_player1)
		{
			move = key_right + key_left;
			if (sprite_index == spr_uppercutfinishingblow)
			{
				other.movespeed = 0;
				other.vsp = -25;
			}
			else
			{
				other.movespeed = 15;
				other.vsp = -6;
			}
		}
	}
	if (obj_player1.state == states.superslam && obj_player1.sprite_index == obj_player1.spr_piledriver)
	{
		switch (character)
		{
			case "N":
				x = obj_player1.x;
				y = obj_player1.y - 40;
				break;
				
			default:
				if (floor(obj_player1.image_index) == 0)
				{
					x = obj_player1.x + (obj_player1.xscale * 10);
					y = obj_player1.y;
				}
				if (floor(obj_player1.image_index) == 1)
				{
					x = obj_player1.x + (obj_player1.xscale * 5);
					y = obj_player1.y;
				}
				if (floor(obj_player1.image_index) == 2)
				{
					x = obj_player1.x;
					y = obj_player1.y;
				}
				if (floor(obj_player1.image_index) == 3)
				{
					x = obj_player1.x + (obj_player1.xscale * -5);
					y = obj_player1.y;
				}
				if (floor(obj_player1.image_index) == 4)
				{
					x = obj_player1.x + (obj_player1.xscale * -10);
					y = obj_player1.y;
				}
				if (floor(obj_player1.image_index) == 5)
				{
					x = obj_player1.x + (obj_player1.xscale * -5);
					y = obj_player1.y;
				}
				if (floor(obj_player1.image_index) == 6)
				{
					x = obj_player1.x;
					y = obj_player1.y;
				}
				if (floor(obj_player1.image_index) == 7)
				{
					x = obj_player1.x + (obj_player1.xscale * 5);
					y = obj_player1.y;
				}
				break;
		}
	}
	if (obj_player1.state == states.grab && obj_player1.sprite_index == obj_player1.spr_swingding)
	{
		if (floor(obj_player1.image_index) == 0)
		{
			x = obj_player1.x + (obj_player1.xscale * 25);
			y = obj_player1.y;
		}
		if (floor(obj_player1.image_index) == 1)
		{
			x = obj_player1.x;
			y = obj_player1.y;
		}
		if (floor(obj_player1.image_index) == 2)
		{
			x = obj_player1.x + (obj_player1.xscale * -25);
			y = obj_player1.y;
		}
		if (floor(obj_player1.image_index) == 3)
		{
			x = obj_player1.x + (obj_player1.xscale * -50);
			y = obj_player1.y;
		}
		if (floor(obj_player1.image_index) == 4)
		{
			x = obj_player1.x + (obj_player1.xscale * -25);
			y = obj_player1.y;
		}
		if (floor(obj_player1.image_index) == 5)
		{
			x = obj_player1.x;
			y = obj_player1.y;
		}
		if (floor(obj_player1.image_index) == 6)
		{
			x = obj_player1.x + (obj_player1.xscale * 25);
			y = obj_player1.y;
		}
		if (floor(obj_player1.image_index) == 7)
		{
			x = obj_player1.x + (obj_player1.xscale * 50);
			y = obj_player1.y;
		}
	}
	if (obj_player1.sprite_index == obj_player1.spr_piledriverland && floor(obj_player1.image_index) == (obj_player1.image_number - 1))
	{
		with (obj_player1)
		{
			state = states.jump;
			vsp = -8;
			sprite_index = spr_machfreefall;
		}
		thrown = true;
		instance_create(x, y, obj_slapstar);
		instance_create(x, y, obj_baddiegibs);
		flash = true;
		x = obj_player1.x;
		y = obj_player1.y;
		state = states.hurt;
		hithsp = -image_xscale * 10;
		hitvsp = -10;
		other.alarm[8] = 60;
		other.alarm[7] = 120;
	}
	if (obj_player1.state != states.mach3)
	{
		sprite_index = spr_hurt;
	}
	else
	{
		sprite_index = spr_fightball;
		image_index = obj_player1.image_index;
	}
	image_speed = 0.4;
}
