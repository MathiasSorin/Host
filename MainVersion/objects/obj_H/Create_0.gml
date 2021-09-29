/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
enum HSTATE
{
	IDLE, WALK, DEAD
}

if(selfSpeed > 0) currentState = HSTATE.WALK
else currentState = HSTATE.IDLE

facingSide = 0

uniForm_Handle = shader_get_uniform(HighlightShader, "texture_Pixel")