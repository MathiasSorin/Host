/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

if(collision_rectangle(x+16, y+8, x+(32-16), y+16+10, obj_Blob, false, true))
{
	obj_Blob.x = x+16
	obj_Blob.y = y-16
}