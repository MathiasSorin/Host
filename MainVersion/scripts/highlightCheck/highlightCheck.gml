// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function highlightCheck()
{
	if(object_index == obj_H or object_index == obj_BigBoss)
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
		tempList = ds_list_create()
		target = collision_circle_list(x, y, 20, obj_H, false, true, tempList, true)
		for(i = 0; i < target; i++;) 
		{
			if(!tempList[| i].dead and tempList[| i].possessed)
			{
				highlight = true
				ds_list_destroy(tempList)
				return false
			}
		}
		highlight = false
		ds_list_destroy(tempList)
	}
	else if(object_index == obj_Crate)
	{
		tempList = ds_list_create()
		target = collision_circle_list(x, y, 20, obj_HStrong, false, true, tempList, true)
		for(i = 0; i < target; i++;) 
		{
			if(!tempList[| i].dead and tempList[| i].possessed)
			{
				highlight = true
				ds_list_destroy(tempList)
				return false
			}
		}
		highlight = false
		ds_list_destroy(tempList)
	}
	else if(object_index == obj_ComputerMobile)
	{
		tempList = ds_list_create()
		tempList2 = ds_list_create()
		tempBool = 0
		target = collision_circle_list(x, y, 20, obj_H, false, true, tempList, true)
		target2 = collision_circle_list(x, y, 20, obj_HStrong, false, true, tempList2, true)
		if(target and !dead)
		{
			for(i = 0; i < target; i++;)
			{
				if(!tempList[| i].dead and tempList[| i].possessed)
				{
					tempBool+=1
				}
			}
		}
		if(target2)
		{
			for(i = 0; i < target2; i++;)
			{
				if(!tempList2[| i].dead and tempList2[| i].possessed and !tempList2[| i].pushing)
				{
					tempBool+=1
				}
			}
		}
		if(tempBool > 0) highlight = true
		else highlight = false
		ds_list_destroy(tempList)
		ds_list_destroy(tempList2)
	}
	if(object_index == obj_Fiole and !dead)
	{
		if(collision_circle(x, y, 20, obj_Blob, false, true)) highlight = true
		else highlight = false
	}
}