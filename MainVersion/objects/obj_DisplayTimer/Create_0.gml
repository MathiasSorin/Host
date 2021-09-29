/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
with(obj_GameTimer) event_user(1)
showTimeMin = floor((obj_GameTimer.finalTime / 1000) / 60)
showTimeSec = (obj_GameTimer.finalTime / 1000) % 60