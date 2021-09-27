// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function folderMiniGame(list)
{
	for (i = 0; i < 3; i += 1)
	{
		temp = instance_find(obj_Folder,i)
		temp.name = list[i]
	}
}