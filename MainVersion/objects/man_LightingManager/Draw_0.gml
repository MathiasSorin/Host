/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

if(!surface_exists(lightingSurface)) lightingSurface = surface_create(room_width , room_height)

surface_set_target(lightingSurface)

draw_clear_alpha(c_black, 0)

with(obj_CircleLight)
{
	//var flicker
	/*var xflickerAmount = image_xscale + random_range()
	var yflickerAmount*/
	
	gpu_set_blendmode(bm_subtract)
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1)
	
	gpu_set_blendmode(bm_add)
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, color, intensity)
	
	gpu_set_blendmode(bm_normal)
}

with(obj_ConeLight)
{
	//var flicker
	gpu_set_blendmode(bm_subtract)
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1)
	
	gpu_set_blendmode(bm_add)
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, color, intensity)
	
	gpu_set_blendmode(bm_normal)
}

surface_reset_target()

draw_surface(lightingSurface, 0, 0)