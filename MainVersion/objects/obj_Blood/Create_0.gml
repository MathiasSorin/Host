/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
/// CREATE EVENT ///

//randomness to the initial puddle
image_xscale = random_range(0.33, 1);
image_yscale = image_xscale;

//move each blood in a random direction
movDir = random(360);

// The low numbers will stay around the puddle, while the high numbers create quick streams
movSpd = random_range(3, 12);

// I want the blood to start out very fast, but also slow down incredibly fast
// The overall splatter will last 2-8 frames
//fric = random_range(movSpd / 8, movSpd / 2);

// As the blood spreads, it thins out
// This creates the *points* at the end of each stream
// The blood will spread for 3-10 frames
sizeChange = random_range(image_xscale / 10, image_xscale / 3); 