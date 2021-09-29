/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
if(other.object_index == obj_Crate)
{
	instance_destroy(other)
	obj_HStrong.pushing = false
	obj_HStrong.pushingCrateId = noone
	on = false
	audio_play_sound(sd_LaserOff, 1, false)
}