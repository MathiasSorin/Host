/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
enum HSSTATE
{
	IDLE, WALK, DEAD, PUSH
}

if(selfSpeed > 0) currentState = HSSTATE.WALK
else currentState = HSSTATE.IDLE

facingSide = 0

uniForm_Handle = shader_get_uniform(HighlightShader, "texture_Pixel")