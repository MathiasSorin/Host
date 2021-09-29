/*
	By: Mathias Sorin
	Last Update: 16/12/2020
*/

if(instance_exists(player) and uiOn) draw_healthbar(player.x-10, player.y-(player.sprite_height/2+25), player.x+10, player.y-(player.sprite_height/2+22), timer, c_black, c_red, c_lime, 0, true, true)

//Test Blood
// Draw blood surface
if (surface_exists(surf))
{
    draw_surface(surf, 0, 0)
}
else
{
    surf = surface_create(room_width, room_height)
}