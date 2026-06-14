if (other.state == states.actor)
{
	exit;
}
if (global.horse)
{
	exit;
}
if (!place_meeting(x, y, obj_doorblocked))
{
	with (other)
	{
		if (key_up && !instance_exists(obj_jumpscare) && other.image_index == 1 && grounded && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.pogo || state == states.mach3 || state == states.Sjumpprep) && !instance_exists(obj_fadeout) && state != states.door && state != states.comingoutdoor)
		{
			
			fmod_event_one_shot("event:/sfx/misc/door");
			obj_camera.chargecamera = 0;
			ds_list_add(global.saveroom, id);
			lastroom = room;
			sprite_index = spr_lookdoor;
			targetDoor = other.targetDoor;
			targetRoom = other.targetRoom;
			image_index = 0;
			state = states.door;
			mach2 = 0;
			other.visited = true;
			instance_create(x, y, obj_fadeout);
		}
	}
}
