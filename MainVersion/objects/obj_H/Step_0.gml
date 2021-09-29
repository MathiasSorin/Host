/*
	By: Mathias Sorin
	Last Update: 16/12/2020
*/
gravityCheck()
HAnim()
if(deaddead) image_index = -1
if(dead) return false
if(possessed) playerInput()
highlightCheck()
if(dead)
{
	ParticulesEffect(x,y-24,obj_BloodSpot,obj_BloodSpit,1,4,0.25,50)
	BloodSplatter(x, y, sprite_height)
}

// Vincent 19/12/2020
if(!possessed and !dead)
{
	x += selfSpeed;
}