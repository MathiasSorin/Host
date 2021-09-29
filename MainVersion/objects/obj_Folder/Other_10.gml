/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

//check answers

if (name == man_FolderManager.elem1 and man_FolderManager.canpress ==1)
{
	audio_play_sound(sd_ComputerYes , 0.5, false)
	folderMiniGame(man_FolderManager.list2)
	man_FolderManager.canpress = 0
	man_FolderManager.alarm[0] = 20
	return false
}
else if(name != man_FolderManager.elem1 and man_FolderManager.canpress ==1) audio_play_sound(sd_ComputerNo , 0.5, false)

if (name == man_FolderManager.elem2 and man_FolderManager.canpress ==1)
{
	audio_play_sound(sd_ComputerYes , 0.5, false)
	folderMiniGame(man_FolderManager.list3)
	man_FolderManager.canpress = 0
	man_FolderManager.alarm[0] = 20
	return false
}
else if(name != man_FolderManager.elem2 and man_FolderManager.canpress ==0) audio_play_sound(sd_ComputerNo , 0.5, false)

if (name == man_FolderManager.elem3 and man_FolderManager.canpress ==1)
{
	audio_play_sound(sd_ComputerYes , 0.5, false)
	obj_Timer.stop = true
	obj_Success.visible = true
	obj_Success.sprite_index = spr_SuccessMove
	audio_play_sound(sd_ComputerCharging , 0.5, false)
	return false
}
else if(name != man_FolderManager.elem3 and man_FolderManager.canpress ==0) audio_play_sound(sd_ComputerNo , 0.5, false)