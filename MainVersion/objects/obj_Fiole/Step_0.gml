/*
	By: Mathias Sorin
	Last Update: 16/12/2020
*/

if(possessed)
{
	man_GameManager.timer = 100
	if(instance_exists(obj_Arrow)) obj_Arrow.visible = false
	playerInputFiole()
	if(sprite_index != spr_Fiole) sprite_index = spr_Fiole
	highlight = false
}
else 
{
	
	if(!dead) sprite_index = spr_FioleEmpty
	else if(sprite_index != spr_FioleBreaking and sprite_index != spr_FioleBroken) sprite_index = spr_FioleBreaking
	highlightCheck()
}