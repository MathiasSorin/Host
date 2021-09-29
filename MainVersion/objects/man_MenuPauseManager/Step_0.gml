/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

//if(started) obj_TitleScreen.image_alpha = clamp(image_alpha - 0.01, 0, 1)

if(!menuOn) instance_destroy()

inputLeftStickV = gamepad_axis_value(0, gp_axislv)
pressX = gamepad_button_check_pressed(0, gp_face1)
pressA = gamepad_button_check_pressed(0, gp_face3)

if (inputLeftStickV <= -0.75 and !obj_Controls.visible and canPress)
{
	if(Button > 0) Button -= 1
	canPress = false
	audio_play_sound(sd_MenuSelect, 1, false)
	alarm_set(0, 20)
}

if (inputLeftStickV >= 0.75 and !obj_Controls.visible and canPress)
{
	if(Button < 3) Button += 1
	canPress = false
	audio_play_sound(sd_MenuSelect, 1, false)
	alarm_set(0, 20)
}

if(Button == 0)
{
	obj_PlayHighlight.visible = true
	obj_HowToPlayHighlight.visible = false
	obj_RestartHighlight.visible = false
	obj_QuitHighlight.visible = false
}
else if(Button == 1)
{
	obj_PlayHighlight.visible = false
	if(!obj_Controls.visible) obj_HowToPlayHighlight.visible = true
	obj_RestartHighlight.visible = false
	obj_QuitHighlight.visible = false
}
else if(Button == 2)
{
	obj_PlayHighlight.visible = false
	obj_HowToPlayHighlight.visible = false
	obj_RestartHighlight.visible = true
	obj_QuitHighlight.visible = false
}
else if(Button == 3)
{
	obj_PlayHighlight.visible = false
	obj_HowToPlayHighlight.visible = false
	obj_RestartHighlight.visible = false
	obj_QuitHighlight.visible = true
}

if (pressX or pressA and canPress)
{
	if(Button == 0)
	{
		game_load("currentLevel.dat")
	}
	else if(Button == 1)
	{
		if(!obj_Controls.visible) 
		{
			obj_Controls.visible = true
			obj_Play.visible = false
			obj_HowToPlay.visible = false
			obj_PlayHighlight.visible = false
			obj_HowToPlayHighlight.visible = false
			obj_TitleScreen.visible = false
			obj_RestartHighlight.visible = false
			obj_QuitHighlight.visible = false
			obj_Quit.visible = false
			obj_Restart.visible = false
			audio_play_sound(sd_MenuClic, 1, false)
		}
		else 
		{
			obj_Controls.visible = false
			obj_TitleScreen.visible = true
			obj_Play.visible = true
			obj_Quit.visible = true
			obj_Restart.visible = true
			obj_HowToPlay.visible = true
			obj_HowToPlayHighlight.visible = true
			audio_play_sound(sd_MenuClic, 1, false)
		}
		alarm_set(0, 20)
	}
	else if(Button == 2)
	{
		game_load("BeginLevel.dat")
	}
	else if(Button == 3) 
	{
		game_end()
	}
}