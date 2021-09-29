/*
	By: Mathias Sorin
	Last Update: 16/12/2020
*/

if(room == FolderMiniGame or room == Room_Pause) return false
if(!timeOut) timer-=10
if(timer == 0)
{
	if(instance_exists(player) and player.object_index == obj_Blob) playerDead(obj_Blob)
	else if(instance_exists(player) and player.object_index == obj_H or player.object_index == obj_HStrong) playerHOut(player)
}
alarm_set(0, 30)