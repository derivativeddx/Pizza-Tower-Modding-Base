function get_char_palette_info(character)
{
	var character_palettes = {
		"P": spr_peppalette,
		"N": spr_noisepalette,
		//"M": spr_peppermanpalette
		// PTMB: Add more characters here as needed
	};
	
	var player_character = obj_savesystem.character;
	
	// Handle swap mode for P and N characters
	if (global.swapmode && (character == "P" || character == "N"))
	{
		var pal_index = (character == "P") ? 1 : 0;
		
		if (player_character == character)
		{
			return {
				spr_palette: obj_player1.spr_palette,
				paletteselect: obj_player1.player_paletteselect[pal_index],
				patterntexture: obj_player1.player_patterntexture[pal_index]
			};
		}
		else
		{
			return {
				spr_palette: character_palettes[$ character],
				paletteselect: obj_player1.player_paletteselect[pal_index],
				patterntexture: obj_player1.player_patterntexture[pal_index]
			};
		}
	}
	
	// Handle non-swapmode or characters without swap mode
	if (player_character == character)
	{
		return {
			spr_palette: obj_player1.spr_palette,
			paletteselect: obj_player1.paletteselect,
			patterntexture: global.palettetexture
		};
	}
	
	// Default case (not the current character)
	var _char_palette = character_palettes[$ character];
	if (is_undefined(_char_palette))
	{
		_char_palette = spr_peppalette;
	}
	
	return {
		spr_palette: _char_palette,
		paletteselect: 1,
		patterntexture: noone
	};
}

