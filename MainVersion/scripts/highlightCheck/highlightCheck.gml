// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function highlightCheck()
{
	if(object_index == obj_H)
	{
		if(collision_circle(x, y, 20, obj_Blob, false, true)) highlight = true
		else highlight = false
	}
	else if(object_index == obj_HStrong)
	{
		if(collision_circle(x, y, 20, obj_Blob, false, true)) highlight = true
		else highlight = false
	}
	else if(object_index == obj_Computer)
	{
		temp = collision_circle(x, y, 20, obj_H, false, true)
		if(collision_circle(x, y, 20, obj_H, false, true) and temp.possessed and !temp.dead) highlight = true
		else highlight = false
	}
	else if(object_index == obj_Crate)
	{
		temp = collision_circle(x, y, 20, obj_HStrong, false, true)
		if(collision_circle(x, y, 20, obj_HStrong, false, true) and !follow and temp.possessed and !temp.dead) highlight = true
		else highlight = false
	}
	else if(object_index == obj_ComputerMobile)
	{
		temp = collision_circle(x, y, 20, obj_H, false, true)
		if(!temp) temp = collision_circle(x, y, 20, obj_HStrong, false, true)
		if(collision_circle(x, y, 20, obj_H, false, true) and temp.possessed and !temp.dead) highlight = true
		else if(collision_circle(x, y, 20, obj_HStrong, false, true) and !follow and temp.possessed and !temp.dead) highlight = true
		else highlight = false
	}
	if(object_index == obj_Fiole and !dead)
	{
		if(collision_circle(x, y, 20, obj_Blob, false, true)) highlight = true
		else highlight = false
	}
}