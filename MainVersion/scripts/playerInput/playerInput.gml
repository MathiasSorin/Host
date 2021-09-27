/*
	By: Mathias Sorin
	Last Update: 16/12/2020
*/

function playerInput()
{
	//Set who is player
	man_GameManager.player = id
	
	//Camera follow
	if(instance_exists(obj_MainCamera)) obj_MainCamera.follow = id
	
	if(object_index == obj_Blob and !canControl) return false
	
	//Player input
	if(currentState == STATE.DEAD) return false
	if (gamepad_is_connected(0)) gamepad_set_axis_deadzone(0, 0.2);
	
	inputLeftStickH = gamepad_axis_value(0, gp_axislh)
	inputRightStickH = gamepad_axis_value(0, gp_axisrh)
	inputRightStickV = gamepad_axis_value(0, gp_axisrv)
	inputInteract = gamepad_button_check_pressed(0, gp_face1)
	inputJump = gamepad_button_check_pressed(0, gp_shoulderrb)
	inputRestart = gamepad_button_check_pressed(0, gp_select)
	
	moveX = inputLeftStickH * selfSpeed
	
	if(sign(inputLeftStickH) != 0 and object_index = obj_Blob and !audio_is_playing(sd_BlobWalk) and !audio_is_playing(sd_BlobWalk2)and grounded) 
	{
		rand = irandom(1)
		if(rand) audio_play_sound(sd_BlobWalk, 0.1, false)
		else audio_play_sound(sd_BlobWalk2, 0.1, false)
	}
	
	//ANIM
	if(sign(inputLeftStickH) != 0 and sprite_index == spr_StrongManPush) idle = false
	else idle = true
	if(sign(inputLeftStickH) != 0 and sprite_index != spr_StrongManPush) 
	{
		image_xscale = sign(inputLeftStickH)
		if(object_index == obj_Blob) currentState = STATE.WALK
		if(object_index == obj_H) currentState = HSTATE.WALK
		if(object_index == obj_HStrong) currentState = HSSTATE.WALK
	}
	else
	{
		if(object_index == obj_Blob) currentState = STATE.IDLE
		if(object_index == obj_H) currentState = HSTATE.IDLE
		if(object_index == obj_HStrong) currentState = HSSTATE.IDLE
	}
	
	if(abs(inputRightStickH) or abs(inputRightStickV))
	{
		if(!instance_exists(obj_Arrow)) instance_create_layer(x, y - (sprite_height/2 + 10), "Instances", obj_Arrow)
		obj_Arrow.x = x
		obj_Arrow.y = y - (sprite_height/2 + 10)
		obj_Arrow.image_angle = point_direction(0, 0, inputRightStickH, inputRightStickV)
		obj_Arrow.direction = obj_Arrow.image_angle
		obj_Arrow.visible = true
		if(object_index == obj_Blob) obj_Arrow.visible = false
	}
	else if(instance_exists(obj_Arrow))
	{
		obj_Arrow.visible = false
		obj_Arrow.direction = 90
	}
	if(inputInteract and man_GameManager.canInteract)
	{
		if(collision_circle(x, y, 20, obj_Computer, false, true) or collision_circle(x, y, 20, obj_ComputerMobile, false, true))
		{
			if(object_index == obj_H)
			{
				target = collision_circle(x, y, 20, obj_Computer, false, true)
				if(!target) target = collision_circle(x, y, 20, obj_ComputerMobile, false, true)
				if(target.dead) return false
				target.dead = true
				target.door.sprite_index = spr_DoorOpen
				if(target.door2 != 0) target.door2.sprite_index = spr_DoorOpen
				target.sprite_index = spr_ComputerOff
				game_save("currentLevel.dat")
				room_goto(FolderMiniGame)
				return false
			}
		}
		if(collision_circle(x, y, 20, obj_Fiole, false, true) and object_index == obj_Blob)
		{
			target = collision_circle(x, y, 20, obj_Fiole, false, true)
			if(target.dead) return false
			target.possessed = true
			man_GameManager.alarm[0] = -1
			man_GameManager.timer = 100
			instance_destroy(obj_Blob)
			game_save("startingLevel.dat")
			audio_play_sound(sd_EnterFiole , 0.5, false)
			return false
		}
		if(collision_circle(x, y, 20, obj_Crate, false, true) and object_index == obj_HStrong)
		{
			target = collision_circle(x, y, 20, obj_Crate, false, true)
			if(!target.follow)
			{
				currentState = HSSTATE.PUSH
				pushing = true
				if(target.x > x) image_xscale = 1
				else image_xscale =-1
				target.idH = id
				target.follow = true
			}
			else
			{
				sprite_index = spr_StrongManIdle
				pushing = false
				target.idH = 0
				target.follow = false
			}
		}
		if(collision_circle(x, y, 20, obj_H, false, true) and object_index == obj_Blob)
		{
			tempList = ds_list_create()
			target = collision_circle_list(x, y, 20, obj_H, false, true, tempList, true)
			for(i = 0; i < target; i++;) if(!tempList[|i].dead) break
			if(!tempList[|i]) return false
			tempList[|i].possessed = true
			tempList[|i].selfSpeed = selfSpeed
			if(instance_exists(obj_MainCamera)) obj_MainCamera.follow = tempList[|i].id
			instance_destroy(obj_Blob)
			man_GameManager.timer = 100
			man_GameManager.player = tempList[|i].id
			ds_list_destroy(tempList)
			return false
		}
		if(collision_circle(x, y, 20, obj_HStrong, false, true) and object_index == obj_Blob)
		{
			tempList = ds_list_create()
			target = collision_circle_list(x, y, 20, obj_HStrong, false, true, tempList, true)
			for(i = 0; i < target; i++;) if(!tempList[|i].dead) break
			if(!tempList[|i]) return false
			tempList[|i].possessed = true
			tempList[|i].selfSpeed = selfSpeed
			if(instance_exists(obj_MainCamera)) obj_MainCamera.follow = tempList[|i].id
			instance_destroy(obj_Blob)
			man_GameManager.timer = 100
			man_GameManager.player = tempList[|i].id
			return false
		}
		man_GameManager.canInteract = false
		man_GameManager.alarm[1] = 20
	}
	if(inputJump and grounded)
	{
		if(object_index == obj_Blob)
		{
			direction = 90
			speed += 12
			grounded = false
			currentState = STATE.JUMP
			rand = irandom(1)
			if(rand) audio_play_sound(sd_Jump, 0.5, false)
			else audio_play_sound(sd_Jump2, 0.5, false)
		}
		else 
		{
			playerHOut(id)
		}
	}
	if(inputRestart)
	{
		man_GameManager.alarm[0] = -1
		man_GameManager.timer = 100
		game_load("startingLevel.dat")
	}
	
	//Horizontal Collision check
	if(place_meeting(x + moveX, y, obj_Collision)) moveX = 0
	if(place_meeting(x + moveX, y, obj_Crate) and object_index == obj_Blob) moveX = 0
	
	// DO WE WANT COLLISION W CRATES ON H ?
	//if(place_meeting(x + moveX, y, obj_Crate) and object_get_name(object_index) != "obj_HStrong") moveX = 0
	
	x += moveX
	target = noone
	if(!grounded) currentState = STATE.JUMP
	return true
}

function playerInputFiole()
{
	if(instance_exists(obj_MainCamera) and !first) obj_MainCamera.follow = id
	man_GameManager.player = id
	inputJump = gamepad_button_check_pressed(0, gp_shoulderrb)
	inputRestart = gamepad_button_check_pressed(0, gp_select)
	
	if(inputJump)
	{
		possessed = false
		dead = true
		instance_create_layer(x, y - sprite_height/2, "Instances", obj_Blob)
		sprite_index = spr_FioleBreaking
		man_GameManager.alarm[0] = 60
		audio_play_sound(sd_ExitFiole , 0.5, false)
	}
	if(inputRestart)
	{
		man_GameManager.alarm[0] = -1
		man_GameManager.timer = 100
		game_load("startingLevel.dat")
	}
}

function playerHOut(H)
{
	audio_play_sound(sd_HeadExplosion, 1, false)
	if(H.object_index == obj_H) H.currentState = HSTATE.DEAD
	if(H.object_index == obj_HStrong) H.currentState = HSSTATE.DEAD
	H.dead = true
	target = instance_create_layer(H.x, H.y - H.sprite_height/2, "Instances", obj_Blob)
	if(instance_exists(obj_Arrow))
	{
		target.direction = obj_Arrow.direction
		target.speed += 17
	}
	else
	{
		target.direction = 90
		target.speed += 17
	}
	man_GameManager.player = target.id
	man_GameManager.timer = 100
}

function playerDead(who)
{
	if(who == obj_Blob)
	{
		obj_Blob.currentState = STATE.DEAD
		audio_play_sound(sd_BlobDeath, 1, false)
		return false
	}
	man_GameManager.player = noone
	man_GameManager.alarm[0] = -1
	man_GameManager.timer = 100
	game_load("startingLevel.dat")
	return false
}
