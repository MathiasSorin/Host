// Thin out the blood as it spreads
image_xscale -= sizeChange;
image_yscale  = image_xscale;

// fade the blood out by a random percentage as it spreads
if (movSpd > 0)
    image_alpha -= random_range(0.05, 0.1);

//draw the blood to surface
if (instance_exists(man_GameManager)) {
    surface_set_target(man_GameManager.surf);
    draw_sprite_ext(spr_BloodSpot, 0, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
    surface_reset_target();  
}

// Destroy self
if (image_xscale <= 0)
    instance_destroy();