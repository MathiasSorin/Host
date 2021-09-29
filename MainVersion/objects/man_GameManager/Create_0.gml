/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
alarm_set(2, 5)
canInteract = true
if(player.object_index != obj_Fiole) alarm_set(0, 60)

// Test blood
surf = surface_create(room_width, room_height)