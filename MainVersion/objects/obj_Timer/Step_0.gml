/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

if (timer > 0)
{
   if(!stop) timer --;
}
else 
{
	stop = true
	obj_Fail.visible = true
	if(!audio_is_playing(sd_ComputerFail)) audio_play_sound(sd_ComputerFail , 0.5, false)
	if(alarm_get(0) < 0) alarm_set(0, 120)
}