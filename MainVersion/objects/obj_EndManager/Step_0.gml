/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
inputLeftStickV = gamepad_axis_value(0, gp_axislv)
pressX = gamepad_button_check_pressed(0, gp_face1)
pressA = gamepad_button_check_pressed(0, gp_face3)

if (inputLeftStickV <= -0.75 and can)
{
	button = 0
	audio_play_sound(sd_MenuSelect, 1, false)
	obj_PlayHighlight.visible = true
	obj_QuitHighlight.visible = false
	can = false
	alarm_set(0, 20)
}

if (inputLeftStickV >= 0.75 and can)
{
	button = 1
	audio_play_sound(sd_MenuSelect, 1, false)
	obj_QuitHighlight.visible = true
	obj_PlayHighlight.visible = false
	can = false
	alarm_set(0, 20)
}

if(pressX or pressA and can)
{
	press+=1
	if(button == 0 and press >= 2) 
	{
		audio_stop_all()
		room_goto(Room_00_Intro)
	}
	else if (button == 1 and press >= 2)
	{
		game_end()
	}
	can = false
	alarm_set(0, 20)
}