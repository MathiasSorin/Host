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
	inputInteract = gamepad_button_check_pressed(0, gp_face3)
	inputJump = gamepad_button_check_pressed(0, gp_shoulderrb)
	inputJumpBlob = gamepad_button_check_pressed(0, gp_face1)
	inputRestart = gamepad_button_check_pressed(0, gp_select)
	inputStart = gamepad_button_check_pressed(0, gp_start)
	
	moveX = inputLeftStickH * selfSpeed
	
	//Audio
	if(sign(inputLeftStickH) != 0 and object_index = obj_Blob and !audio_is_playing(sd_BlobWalk) and !audio_is_playing(sd_BlobWalk2)and grounded) 
	{
		rand = irandom(1)
		if(rand) audio_play_sound(sd_BlobWalk, 0.1, false)
		else audio_play_sound(sd_BlobWalk2, 0.1, false)
	}
	if(sign(inputLeftStickH) != 0 and !audio_is_playing(sd_FootStep2) and grounded and object_index == obj_H) audio_play_sound(sd_FootStep2, 0.1, false)
	if(sign(inputLeftStickH) != 0 and !audio_is_playing(sd_FootStep2) and grounded and object_index == obj_HStrong) audio_play_sound(sd_FootStep2, 0.1, false)
	
	//Anim
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
				gamepad_set_vibration(0, 0, 0)
				target = collision_circle(x, y, 20, obj_Computer, false, true)
				if(!target or target.dead) target = collision_circle(x, y, 20, obj_ComputerMobile, false, true)
				if(!instance_exists(target) or target.dead) return false
				target.dead = true
				if(!instance_exists(target.door)) return false
				target.door.sprite_index = spr_DoorOpen
				if(target.door2 != 0) target.door2.sprite_index = spr_DoorOpen
				if(target.object_index == obj_Computer) target.sprite_index = spr_ComputerOff
				else target.sprite_index = spr_ComputerMobileOff
				game_save("currentLevel.dat")
				ClearBloodSplatter()
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
				pushingCrateId = target.id
			}
			else
			{
				sprite_index = spr_StrongManIdle
				pushing = false
				target.idH = 0
				target.follow = false
				pushingCrateId = noone
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
			man_GameManager.canInteract = false
			man_GameManager.alarm[1] = 20
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
			ds_list_destroy(tempList)
			man_GameManager.canInteract = false
			man_GameManager.alarm[1] = 20
			return false
		}
		man_GameManager.canInteract = false
		man_GameManager.alarm[1] = 20
	}
	if(inputJumpBlob and grounded)
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
	}
	if(inputJump and object_index != obj_Blob and grounded) playerHOut(id)
	if(inputRestart)
	{
		gamepad_set_vibration(0, 0, 0)
		man_GameManager.alarm[0] = -1
		man_GameManager.timer = 100
		ClearBloodSplatter()
		game_load("startingLevel.dat")
	}
	if(inputStart) 
	{
		gamepad_set_vibration(0, 0, 0)
		game_save("currentLevel.dat")
		ClearBloodSplatter()
		room_goto(Room_Pause)
		return false
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
	inputJump = gamepad_button_check_pressed(0, gp_face1)
	inputJump2 = gamepad_button_check_pressed(0, gp_shoulderrb)
	inputRestart = gamepad_button_check_pressed(0, gp_select)
	inputStart = gamepad_button_check_pressed(0, gp_start)
	
	if(inputJump or inputJump2)
	{
		possessed = false
		dead = true
		instance_create_layer(x, y - sprite_height/2, "Instances", obj_Blob)
		sprite_index = spr_FioleBreaking
		man_GameManager.alarm[0] = 30
		audio_play_sound(sd_ExitFiole , 0.5, false)
	}
	if(inputRestart)
	{
		gamepad_set_vibration(0, 0, 0)
		man_GameManager.alarm[0] = -1
		man_GameManager.timer = 100
		ClearBloodSplatter()
		game_load("startingLevel.dat")
	}
	if(inputStart) 
	{
		gamepad_set_vibration(0, 0, 0)
		game_save("currentLevel.dat")
		ClearBloodSplatter()
		room_goto(Room_Pause)
		return false
	}
}

function playerHOut(H)
{
	gamepad_set_vibration(0, 1, 1)
	man_GameManager.alarm[3] = 15
	possessed = false
	audio_play_sound(sd_HeadExplosion, 1, false)
	BloodSplatter(H.x, H.y, H.sprite_height)
	if(H.object_index == obj_H) 
	{
		H.facingSide = image_xscale
		H.dead = true
		H.currentState = HSTATE.DEAD
	}
	if(H.object_index == obj_HStrong) 
	{
		H.facingSide = image_xscale
		H.dead = true
		H.currentState = HSSTATE.DEAD
		H.pushing = false
		if(H.pushingCrateId) H.pushingCrateId.follow = false
	}
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
	gamepad_set_vibration(0, 0, 0)
	if(who == obj_Blob)
	{
		if(obj_Blob.currentState != STATE.DEAD) audio_play_sound(sd_BlobDeath, 1, false)
		obj_Blob.currentState = STATE.DEAD
		return false
	}
	man_GameManager.player = noone
	man_GameManager.alarm[0] = -1
	man_GameManager.timer = 100
	ClearBloodSplatter()
	game_load("startingLevel.dat")
	return false
}
