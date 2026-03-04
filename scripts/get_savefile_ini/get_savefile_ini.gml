function get_savefile_ini(_character = "P")
{
	if (global.swapmode)
	{
		_character = "N";
	}
	
	return concat("saveData", global.currentsavefileindex, ((_character == "P") ? "" : string(_character)), ".ini");
}
