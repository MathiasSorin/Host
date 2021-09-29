/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

if(currentState == STATE.DEAD)
{
	man_GameManager.player = noone
	man_GameManager.alarm[0] = -1
	man_GameManager.timer = 100
	man_GameManager.timeOut = false
	ClearBloodSplatter()
	game_load("startingLevel.dat")
}

if(currentState == STATE.JUMP)
{
	image_index = -1
}

