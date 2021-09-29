/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

//if(started) obj_TitleScreen.image_alpha = clamp(image_alpha - 0.01, 0, 1)

if(!menuOn) instance_destroy()

inputLeftStickV = gamepad_axis_value(0, gp_axislv)
pressX = gamepad_button_check_pressed(0, gp_face1)

if (inputLeftStickV <= -0.75 and !obj_Controls.visible and canPress)
{
	Button = 0
	obj_PlayHighlight.visible = true
	obj_HowToPlayHighlight.visible = false
	canPress = false
	audio_play_sound(sd_MenuSelect, 1, false)
	alarm_set(0, 20)
}

if (inputLeftStickV >= 0.75 and !obj_Controls.visible and canPress)
{
	Button = 1
	obj_PlayHighlight.visible = false
	obj_HowToPlayHighlight.visible = true
	canPress = false
	audio_play_sound(sd_MenuSelect, 1, false)
	alarm_set(0, 20)
}

if (pressX and canPress)
{
	if(Button == 0)
	{
		instance_destroy(obj_FolderHighlight)
		instance_destroy(obj_HowToPlay)
		instance_destroy(obj_Play)
		instance_destroy(obj_TitleScreen)
		instance_destroy(obj_PlayHighlight)
		instance_destroy(obj_HowToPlayHighlight)
		menuOn = false
		obj_Blob.canControl = true
		with(obj_GameTimer) event_user(0)
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
			audio_play_sound(sd_MenuClic, 1, false)
		}
		else 
		{
			obj_Controls.visible = false
			obj_TitleScreen.visible = true
			obj_Play.visible = true
			obj_HowToPlay.visible = true
			obj_HowToPlayHighlight.visible = true
			audio_play_sound(sd_MenuClic, 1, false)
		}
		alarm_set(0, 20)
	}
}