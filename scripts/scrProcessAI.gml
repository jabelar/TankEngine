// show_debug_message("scrProcessAI starting")
// creates input but based on computer AI

//update sense of surroundings
scrProcessEnvironment()
   
// only process enemy if it exists (i.e. wasn't killed or respawning)
if enemy_id != -1
{
    if path_found then key_forward = true
    if abs(angle_difference(direction, image_angle)) >= current_turn_speed
    {
        key_forward = false // stop to turn like the direct mode of human controls
        if angle_difference(direction, image_angle) > 0
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
