/// @description Process stuff
#region//Input 
left = keyboard_check(vk_left) || keyboard_check(ord("A"));
right = keyboard_check(vk_right) || keyboard_check(ord("D"));
up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
shoot = mouse_check_button_pressed(mb_left);
#endregion
#region //Movement
//Horizontal
move = right - left;
move_status = left || right;
run = keyboard_check(vk_shift) &&(move_status);
out_run = keyboard_check_released(vk_shift);
hsp = move*walk_speed;
if (place_meeting(x + hsp,y,o_block)){while(!place_meeting(x + sign(hsp),y,o_block)){x += sign(hsp);} hsp = 0;}
x += hsp;
if ((run)) {walk_speed = 7; run_status = true;} 
else {walk_speed = 5;}
//Vertical
vsp += grav;
if (place_meeting(x,y + vsp,o_block)){while(!place_meeting(x,y + sign(vsp),o_block)){y+= sign(vsp);} vsp = 0;}
y += vsp;
if (place_meeting(x,y + 1,o_block) && (up)) {
	vsp = -15;
	jump_status = true;
		if (jump_status == true){
				
		}
}
#endregion
#region //Animation
if (!place_meeting(x,y + 1,o_block)){image_speed = 1;sprite_index = s_player_jump;}	
else{image_speed = 1; if (hsp == 0) {sprite_index = s_player_idle;} else {sprite_index = s_player_walk; image_speed = 1;}}
if (sign(hsp) != 0) {image_xscale = sign(hsp);}
if (run_status == true && !(out_run)){ sprite_index = s_player_run; image_speed = 1; run_status = false;}
#endregion