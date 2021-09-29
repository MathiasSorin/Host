/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
if(other.y > y) 
{
	sprite_collision_mask(sprite_index, true, 0, 0, 0, 0, 0, bboxkind_rectangular, 255)
	show_debug_message("en dessous")
}
else sprite_collision_mask(sprite_index, true, 1, 0, 0, 0, 0, 0, 0)