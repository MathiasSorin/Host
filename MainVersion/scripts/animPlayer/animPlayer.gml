// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function blobAnim()
{
	switch (currentState)
	{
		case STATE.JUMP:
			sprite_index = spr_Blob_Jump
			break
		case STATE.WALK:
			sprite_index = spr_Blob_Walk
			break
		case STATE.IDLE:
			sprite_index = spr_Blob_Idle
			break
		case STATE.DEAD:
			sprite_index = spr_Blob_Death
			break
	}
}

function HAnim()
{
	switch (currentState)
	{
		case HSTATE.DEAD:
			sprite_index = spr_ScientistDeath
			break
		case HSTATE.IDLE:
			sprite_index = spr_ScientistIdle
			break
		case HSTATE.WALK:
			sprite_index = spr_ScientistWalk
			break
	}
}

function HSAnim()
{
	if(pushing and !dead) currentState = HSSTATE.PUSH
	switch (currentState)
	{
		case HSSTATE.DEAD:
			sprite_index = spr_StrongManDeath
			break
		case HSSTATE.IDLE:
			sprite_index = spr_StrongManIdle
			break
		case HSSTATE.WALK:
			sprite_index = spr_StrongManWalk
			break
		case HSSTATE.PUSH:
			sprite_index = spr_StrongManPush
			if(idle) image_index = 0
			break
	}
}