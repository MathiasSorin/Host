/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

if(collision_circle(x, y, 25, obj_Blob, false, true))
{
	instance_destroy(obj_MainCamera)
	instance_create_layer(x, y, "Instances", obj_EndCamera)
	instance_destroy(obj_Blob)
	man_GameManager.timeOut = true
	man_GameManager.player = id
	man_GameManager.uiOn = false
	obj_BigBoss.trigger = true
}

if(trigger) 
{
	gamepad_set_vibration(0, 1, 1)
	man_GameManager.alarm[3] = 15
	audio_play_sound(sd_HeadExplosion, 1, false)
	ParticulesEffect(x,y-24,obj_invisibleQuiFaitRien,obj_BloodSpit,1,4,0.25,5)
	BloodSplatter(x, y, sprite_height)
	sprite_index = spr_BigBossDeath
	trigger = false
}