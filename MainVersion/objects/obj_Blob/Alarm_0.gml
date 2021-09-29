/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
grounded = false
speed = 0
if(!place_meeting(x, y-30, obj_Collision))
{
	direction = 90
	speed += 12
}