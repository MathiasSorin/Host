/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

if(obj_Timer.stop) return false

inputLeftStickH = gamepad_axis_value(0, gp_axislh)

if (inputLeftStickH >= 0.75 and i < 2 and canmove)
{
	i += 1
	canmove = 0
	audio_play_sound(sd_MenuSelect, 1, false)
	alarm_set(0, 20)
}

if (inputLeftStickH <= -0.75 and i > 0 and canmove)
{
	i -= 1
	canmove = 0
	audio_play_sound(sd_MenuSelect, 1, false)
	alarm_set(0, 20)
}

temp = instance_find(obj_Folder,i)

obj_FolderHighlight.x = temp.x

pressX = gamepad_button_check_pressed(0, gp_face1)
pressA = gamepad_button_check_pressed(0, gp_face3)

if (pressX or pressA and canpress == 1)
{
	with (temp)
	{
		event_user(0)
	}
}