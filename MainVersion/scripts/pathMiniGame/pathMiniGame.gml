// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pathMiniGame(){
//move

	inputLeftStickH = gamepad_axis_value(0, gp_axislh)
	inputLeftStickV = gamepad_axis_value(0, gp_axislv)

	moveX = inputLeftStickH * selfSpeed
	moveY = inputLeftStickV * selfSpeed
	
//Horizontal & Vertical Collision check
	if(place_meeting(x + moveX, y, obj_Collision)) moveX = 0
	if(place_meeting(x, y + moveY, obj_Collision)) moveY = 0

	x += moveX
	y += moveY
}