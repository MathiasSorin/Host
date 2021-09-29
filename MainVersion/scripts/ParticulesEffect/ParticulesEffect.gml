function ParticulesEffect(PositionX,PositionY,BloodSpot,Particule,minVitesseParticule,maxVitesseParticule,Gravite,NombreDeParticules)
{
	
	instance_create_layer(PositionX,PositionY,"Instance_Particule",BloodSpot)
	for(i = 0; i < random_range(NombreDeParticules/2,NombreDeParticules); i++;)
	{
		
	temp = instance_create_layer(PositionX,PositionY,"Instance_Particule",Particule);
	temp.vspeed = random_range(minVitesseParticule,maxVitesseParticule);
	temp.hspeed = random_range(minVitesseParticule,maxVitesseParticule);
	temp.direction = irandom(359);
	temp.gravity = Gravite;

	
	}
}

function BloodSplatter(X, Y, H)
{
	var count = random_range(4, 32);

	for (var i = 0; i < count; i++) 
	{
		// Spawn blood within an 8x8 square
		instance_create_layer(X + random_range(-8, 8), (Y - H/2) + random_range(-8, 8), "Instances_Splatter",obj_Blood);
	}
}

function ClearBloodSplatter()
{
	surface_set_target(man_GameManager.surf);
	draw_clear_alpha(0, 0);
	surface_reset_target();
}