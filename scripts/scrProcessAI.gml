// show_debug_message("scrProcessAI starting")
// creates input but based on computer AI

//update sense of surroundings
scrProcessEnvironment()
   
// only process enemy if it exists (i.e. wasn't killed or respawning)
if enemy_id != -1
{
    switch ai_target
    {
        case ENEMY:
        {
            // process turning
            if point_direction(x, y, enemy_id.x, enemy_id.y) > direction+my_turn_speed then key_left = true
            if point_direction(x, y, enemy_id.x, enemy_id.y) < direction-my_turn_speed then key_right = true
            image_angle = direction
            // process shooting
            if distance_to_object(enemy_id) < 16*room_speed // close enough to start shooting
            {
                key_weapon1_pressed = true
            }
            key_forward = true
            break ;
        }
        case HOME:
        {
            // process turning
            if point_direction(x, y, home_id.x, enemy_flag_id.y) > direction+my_turn_speed then key_left = true
            if point_direction(x, y, home_id.x, enemy_flag_id.y) < direction-my_turn_speed then key_right = true
            image_angle = direction
            key_forward = true
            break ;
        }
        case ENEMY_FLAG:
        {
            // process turning
            if point_direction(x, y, enemy_flag_id.x, enemy_flag_id.y) > direction+my_turn_speed then key_left = true
            if point_direction(x, y, enemy_flag_id.x, enemy_flag_id.y) < direction-my_turn_speed then key_right = true
            image_angle = direction
            key_forward = true
            break ;
        }
        case HEALTH:
        {
            // process turning
            if point_direction(x, y, nearest_health_id.x, nearest_health_id.y) > direction+my_turn_speed then key_left = true
            if point_direction(x, y, nearest_health_id.x, nearest_health_id.y) < direction-my_turn_speed then key_right = true
            image_angle = direction
            key_forward = true
            break ;
        }
        case AMMO:
        {
            // process turning
            if point_direction(x, y, nearest_ammo_id.x, nearest_ammo_id.y) > direction+my_turn_speed then key_left = true
            if point_direction(x, y, nearest_ammo_id.x, nearest_ammo_id.y) < direction-my_turn_speed then key_right = true
            image_angle = direction
            key_forward = true
            break ;
        }        
    }
}
// show_debug_message("scrProcessAI finished")
