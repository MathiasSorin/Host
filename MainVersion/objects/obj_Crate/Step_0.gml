/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

highlightCheck()

if(instance_exists(idH))
{
	if(follow)
	{
		if(x < idH.x )
		{
			x = idH.x - 32
			y = idH.y + 12
		}
		else
		{
			x = idH.x + 32
			y = idH.y + 12
		}
	}
}
gravityCheck()