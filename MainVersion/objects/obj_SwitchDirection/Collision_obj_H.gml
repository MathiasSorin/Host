/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

if (!other.possessed and on)
{
	on = false
	idH = other.id
	idinstanceSpeed = other.selfSpeed
	if(pauseTime > 0)
	{
		other.currentState = HSTATE.IDLE
		other.selfSpeed = 0
		alarm_set(0, pauseTime)
	}
	else
	{
		other.selfSpeed *= -1;
		image_xscale *=-1;
	}
}