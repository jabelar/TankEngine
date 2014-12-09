// clear input
key_forward = false 
key_right = false 
key_left = false 
key_backward = false 
key_change_spawn = false 
key_flag = false 
key_weapon1_pressed = false
key_weapon2_pressed = false 
key_weapon3_pressed = false

if player_type = HUMAN
{
    if input_style = KEYBOARD
    {

        if keyboard_check(input_forward) then key_forward = true
        if keyboard_check(input_right) then key_right = true
        if keyboard_check(input_left) then key_left = true
        if keyboard_check(input_backward) then key_backward = true
        if keyboard_check(input_change_spawn) then key_change_spawn = true
        key_flag = keyboard_check_pressed(input_flag)
        key_weapon1_pressed = keyboard_check_pressed(input_fire1) 
        key_weapon2_pressed = keyboard_check_pressed(input_fire2) 
        key_weapon3_pressed = keyboard_check_pressed(input_fire3) 
    
        // resolve keypress conflicts
        if key_forward and key_backward
        {
            key_forward = false
            key_backward = false
        }
        if key_right and key_left
        {
            key_right = false
            key_left = false
        }
    }
    else if input_style = JOYSTICK
    {
        // if joystick_direction(current_player) = vk_numpad8
        if gamepad_axis_value(1, gp_axislv) < 0
        {
            key_forward = true ;
        }
        // if joystick_direction(current_player) = vk_numpad4
        if gamepad_axis_value(1, gp_axisrh) < 0
        {
            key_left = true ;
        }
        // if joystick_direction(current_player) = vk_numpad6
        if gamepad_axis_value(1, gp_axisrh) > 0
        {
            key_right = true ;
        }
        // if joystick_direction(current_player) = vk_numpad2
        if gamepad_axis_value(1, gp_axislv) > 0
        {
            key_backward = true ;
        }
    
        // key_weapon1_pressed = scrJoystickCheckButtonPressed(current_player, 5) 
        
        // TODO
        // need to process current player stuff mapped to controller
        key_weapon1_pressed = gamepad_button_check_pressed(1, gp_shoulderr) or gamepad_button_check_pressed(1, gp_shoulderrb);
        key_weapon2_pressed = gamepad_button_check_pressed(1, gp_shoulderl) or gamepad_button_check_pressed(1, gp_shoulderlb); 
        key_weapon3_pressed = gamepad_button_check_pressed(1, gp_face3);
    }
    else if input_style = JOYSTICK_SEP
    {
        // if joystick_direction(current_player) = vk_numpad8
        if gamepad_axis_value(1, gp_axislv) < 0
        {
            key_forward = true ;
        }
        // if joystick_direction(current_player) = vk_numpad4
        if gamepad_axis_value(1, gp_axislh) < 0
        {
            key_left = true ;
        }
        // if joystick_direction(current_player) = vk_numpad6
        if gamepad_axis_value(1, gp_axislh) > 0
        {
            key_right = true ;
        }
        // if joystick_direction(current_player) = vk_numpad2
        if gamepad_axis_value(1, gp_axislv) > 0
        {
            key_backward = true ;
        }
    
        // turret independently controlled
        if gamepad_axis_value(1, gp_axisrh) > 0
        {
            angle_main_gun += TANK_TURN_SPEED_BASE*TANK_TURRET_SPEED_MULTIPLIER
        }
        if gamepad_axis_value(1, gp_axisrh) < 0
        {
            angle_main_gun -= TANK_TURN_SPEED_BASE*TANK_TURRET_SPEED_MULTIPLIER
        }
        
        // TODO
        // need to process current player stuff mapped to controller
        key_weapon1_pressed = gamepad_button_check_pressed(1, gp_shoulderr) or gamepad_button_check_pressed(1, gp_shoulderrb);
        key_weapon2_pressed = gamepad_button_check_pressed(1, gp_shoulderl) or gamepad_button_check_pressed(1, gp_shoulderlb); 
        key_weapon3_pressed = gamepad_button_check_pressed(1, gp_face3);
    }
}
else // computer player so process AI
{
    scrProcessAI()
}
