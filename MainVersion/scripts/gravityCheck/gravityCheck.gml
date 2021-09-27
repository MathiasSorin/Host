// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function gravityCheck()
{
	falling = false
	if(place_meeting(x, y + 1, obj_Collision) or place_meeting(x, y + 1, obj_Crate)) 
	{	
		grounded = true
		return false
	}
	else if(!place_meeting(x, y + man_GameManager.gravityStrenght, obj_Collision) and !place_meeting(x, y + man_GameManager.gravityStrenght, obj_Crate))
	{
		falling = true
	    y += man_GameManager.gravityStrenght
	    if (man_GameManager.gravityStrenght < man_GameManager.maxgravityStrenght) man_GameManager.gravityStrenght += 0.1
	}
	else while(!place_meeting(x, y + 1, obj_Collision) and !place_meeting(x, y + 1, obj_Crate)) y += 1
	if (falling == false) man_GameManager.gravityStrenght = 5
}
