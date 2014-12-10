// tank movement input
if input_style_tank = TANK_KEYBOARD
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
else if input_style_tank = TANK_JOYSTICK_PAIR
{
    if gamepad_axis_value(1, gp_axislv) < 0
    {
        key_forward = true ;
    }
    if gamepad_axis_value(1, gp_axisrh) < 0
    {
        key_left = true ;
    }
    if gamepad_axis_value(1, gp_axisrh) > 0
    {
        key_right = true ;
    }
    if gamepad_axis_value(1, gp_axislv) > 0
    {
        key_backward = true ;
    }

    // TODO
    // need to process current player stuff mapped to controller
    key_weapon1_pressed = gamepad_button_check_pressed(1, gp_shoulderr) or gamepad_button_check_pressed(1, gp_shoulderrb);
    key_weapon2_pressed = gamepad_button_check_pressed(1, gp_shoulderl) or gamepad_button_check_pressed(1, gp_shoulderlb); 
    key_weapon3_pressed = gamepad_button_check_pressed(1, gp_face3);
}
else if input_style_tank = TANK_JOYSTICK_SING
{
    if gamepad_axis_value(1, gp_axislv) < 0
    {
        key_forward = true ;
    }
    if gamepad_axis_value(1, gp_axislh) < 0
    {
        key_left = true ;
    }
    if gamepad_axis_value(1, gp_axislh) > 0
    {
        key_right = true ;
    }        // if joystick_direction(current_player) = vk_numpad2
    if gamepad_axis_value(1, gp_axislv) > 0
    {
        key_backward = true ;
    }
            
    // TODO
    // need to process current player stuff mapped to controller
    key_weapon1_pressed = gamepad_button_check_pressed(1, gp_shoulderr) or gamepad_button_check_pressed(1, gp_shoulderrb);
    key_weapon2_pressed = gamepad_button_check_pressed(1, gp_shoulderl) or gamepad_button_check_pressed(1, gp_shoulderlb); 
    key_weapon3_pressed = gamepad_button_check_pressed(1, gp_face3);
}
else if input_style_tank = TANK_JOYSTICK_DIR
{
    joy_direction = point_direction(0, 0, gamepad_axis_value(1, gp_axislh), gamepad_axis_value(1, gp_axislv));
    joy_distance = point_distance(0, 0, gamepad_axis_value(1, gp_axislh), gamepad_axis_value(1, gp_axislv));
    ang_diff = angle_difference(joy_direction, image_angle)
    
    if joy_distance > 0
    {
        if abs(ang_diff) < TANK_TURN_SPEED_BASE
        {
            key_forward = true ;
        }
        else if abs(ang_diff) > (180 - TANK_TURN_SPEED_BASE * 9)
        {
            key_backward = true ;
        }
        else if ang_diff < 0
        {
            key_right = true ;
        }
        else if ang_diff > 0
        {
            key_left = true ;
        }
    }
            
    // TODO
    // need to process current player stuff mapped to controller
    key_weapon1_pressed = gamepad_button_check_pressed(1, gp_shoulderr) or gamepad_button_check_pressed(1, gp_shoulderrb);
    key_weapon2_pressed = gamepad_button_check_pressed(1, gp_shoulderl) or gamepad_button_check_pressed(1, gp_shoulderlb); 
    key_weapon3_pressed = gamepad_button_check_pressed(1, gp_face3);
}

