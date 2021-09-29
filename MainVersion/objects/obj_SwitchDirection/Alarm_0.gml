/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

if(instance_exists(idH))
{
	if(!idH.possessed)
	{
		idH.image_xscale *=-1;
		idH.selfSpeed = idinstanceSpeed*-1
		if(idH.object_index == obj_H) idH.currentState = HSTATE.WALK
		if(idH.object_index == obj_HStrong) idH.currentState = HSSTATE.WALK
		alarm_set(1, 5)
	}
}