scr_menu_getinput();
var _move_v = key_up2 - key_down2;
if (_move_v > 0)
{
	fmod_event_one_shot("event:/sfx/ui/switchcharup");
}
else
{
	fmod_event_one_shot("event:/sfx/ui/switchchardown");
}