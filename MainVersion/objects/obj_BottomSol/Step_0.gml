/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

if(deaddead) image_index = -1

if(collision_rectangle(x+16, y, x+(sprite_width-16), y-10, obj_Blob, false, true) and open)
{
	open = false
	obj_Blob.x = x+16
	obj_Blob.y = y+32
	sprite_index = spr_BottomSolAnim
}