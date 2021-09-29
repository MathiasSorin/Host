/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
if(sprite_index == spr_BigBossDeath)
{
	image_speed = 0
	image_index = -1
	alarm_set(0, 100)
	temp1 = instance_create_layer(x-15, y-sprite_height/2, "Instances", obj_fakeblob)
	temp1.speed = 6
	temp1.direction = 180
	temp2 = instance_create_layer(x+15, y-sprite_height/2, "Instances", obj_fakeblobred)
	temp2.speed = 6
}