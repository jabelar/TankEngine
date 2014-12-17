// show_debug_message("scrProcessAI starting")
// creates input but based on computer AI

//update sense of surroundings
scrProcessEnvironment()
   
// only process enemy if it exists (i.e. wasn't killed or respawning)
if enemy_id != -1
{
    // don't move forward unless there is a path found
    key_forward = false
    if path_found
    {
        key_forward = true
    }
    
    if abs(angle_difference(direction, image_angle)) >= current_turn_speed
    {
        key_forward = false // stop to turn like the direct mode of human controls
        if angle_difference(direction, image_angle) < 0
        {
            key_right = true
            key_left = false
        }
        else
        {
            key_right = false
            key_left = true
        }
    }

    switch ai_target
    {
        case ENEMY:
        {
            // turn turret
            dir_to_enemy = point_direction(x, y, enemy_id.x, enemy_id.y)
            if abs(angle_difference(dir_to_enemy, direction+angle_main_gun)) < TANK_TURN_SPEED_BASE*TANK_TURRET_SPEED_MULTIPLIER
            {
                // clamp angle to direction
                // angle_main_gun = dir_to_enemy-direction
                key_turret_right = false
                key_turret_left = false
            }
            else // need to turn
            {
                if angle_difference(dir_to_enemy, direction+angle_main_gun) > 0
                {
                    key_turret_right = false
                    key_turret_left = true
                }
                else
                {
                    key_turret_right = true
                    key_turret_left = false
                }                
                // angle_main_gun += sign(angle_difference(dir_to_enemy, direction+angle_main_gun))*TANK_TURN_SPEED_BASE*TANK_TURRET_SPEED_MULTIPLIER
            }
            // process shooting
            if distance_to_object(enemy_id) < 16*room_speed // close enough to start shooting
            {
                key_weapon1_pressed = true
            }
            break ;
        }
        case HOME:
        {
            break ;
        }
        case ENEMY_FLAG:
        {
            break ;
        }
        case HEALTH:
        {
            break ;
        }
        case AMMO:
        {
            break ;
        }        
    }
}
// show_debug_message("scrProcessAI finished")