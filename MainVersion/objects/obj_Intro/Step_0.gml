/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
if(compteur < 4)
then
{
            if(activable)
            then
            {
                if(place_meeting(x-3,y,obj_Blob))
                then {
					ParticulesEffect(x,y+32,obj_invisibleQuiFaitRien,obj_GlassShard,1,4,0.25,50)
					gamepad_set_vibration(0, 1, 1)
					man_GameManager.alarm[3] = 15
					audio_play_sound(sd_BangingOnGlass, 1, false)
					obj_Blob.speed-=4
                     obj_CuveIntro.image_index ++;
                     with(obj_CuveIntro){event_user(0)};
                     compteur ++;
                     activable = false; 
                     alarm [0] = 40;
                     }
}

else
if(compteur == 3)
then{
	audio_play_sound(sd_ExitFiole, 1, false)
    instance_destroy();
}

}