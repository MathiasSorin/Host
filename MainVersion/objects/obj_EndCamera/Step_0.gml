/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

/* okay va falloir voir ça avc les boys value plus basse = tight snappy coller au joueur
	plus haute = floaty lente moins envie de vomir
*/

//offsetDir = (offset*dir)*-1
//out = false

/*if(xTo <= x-borderH) out = true
if(xTo >= x+borderH) out = true

/*if(out and offsetDir == -offset) 
{
	if(x != xTo-offsetDir-borderH) x += (xTo-offsetDir-borderH-x)/20
	else x += ((xTo-offsetDir-borderH)-x)/20
	previous1 = x
}
if(out and offsetDir == offset)
{
	if(x != xTo-offsetDir-borderH) x += (xTo-offsetDir-borderH-x)/20
	else x += ((xTo-offsetDir-borderH)-x)/20
	previous2 = x
}

/*
//show_debug_message(offsetDir)
if(out and offsetDir == -offset) 
{
	if(x != previous2*-1) x += (xTo-offsetDir+borderH-x)
	else x += ((xTo-offsetDir-borderH)-x)/20
	previous1 = x
}
if(out and offsetDir == offset)
{
	if(x != previous1*-1) x += (xTo-offsetDir-borderH-x)
	else x += ((xTo-offsetDir-borderH)-x)/20
	previous2 = x
}*/
//if(offsetDir == 0) x += (xTo-x)/20

if(xTo <= x-borderH or xTo >= x+borderH) if(x != xTo) x += (xTo - x)/cameraSpeed
if(yTo <= y-borderV or yTo >= y+borderV) if(y != yTo) y += (yTo - y)/cameraSpeed

if(instance_exists(follow) and follow != noone)
{
	xTo = follow.x
	yTo = follow.y
}
else
{
	xTo = xStartPos
	yTo = yStartPos
}

vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0)
camera_set_view_mat(camera, vm)