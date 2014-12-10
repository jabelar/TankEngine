// turret movement input
if input_style_turret = TURRET_KEYBOARD
{
    // do nothing, turret fixed
    angle_main_gun = 0
}
else if input_style_turret = TURRET_JOYSTICK_PAIR
{
    // do nothing, turret fixed
    angle_main_gun = 0
}
else if input_style_turret = TURRET_JOYSTICK_SING
{
    // turret independently controlled
    if gamepad_axis_value(1, gp_axisrh) < 0
    {
        angle_main_gun += TANK_TURN_SPEED_BASE*TANK_TURRET_SPEED_MULTIPLIER
    }
    if gamepad_axis_value(1, gp_axisrh) > 0
    {
        angle_main_gun -= TANK_TURN_SPEED_BASE*TANK_TURRET_SPEED_MULTIPLIER
    }
}
else if input_style_turret = TURRET_JOYSTICK_DIR
{
    // turret independently controlled
    joy_direction = point_direction(0, 0, gamepad_axis_value(1, gp_axisrh), gamepad_axis_value(1, gp_axisrv));
    joy_distance = point_distance(0, 0, gamepad_axis_value(1, gp_axisrh), gamepad_axis_value(1, gp_axisrv));
    ang_diff = angle_difference(joy_direction, image_angle+angle_main_gun)
    if joy_distance > 0
    {
        if ang_diff < 0 - TANK_TURN_SPEED_BASE*TANK_TURRET_SPEED_MULTIPLIER
        {
            angle_main_gun -= TANK_TURN_SPEED_BASE*TANK_TURRET_SPEED_MULTIPLIER
        }
        if ang_diff > TANK_TURN_SPEED_BASE*TANK_TURRET_SPEED_MULTIPLIER
        {
            angle_main_gun += TANK_TURN_SPEED_BASE*TANK_TURRET_SPEED_MULTIPLIER
        }
    }
}    