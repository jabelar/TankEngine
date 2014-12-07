// creates input but based on computer AI

//update sense of surroundings
scrProcessEnvironment()

// set pathfinding options
mp_potential_settings(30, 5, 10, true)

// figure out who the enemy is
enemy_id = -1
if current_player = PLAYER1 
{
    if instance_exists(objPlayer2)
    {
        enemy_id = objPlayer2.id
        enemy_flag_id = objFlagBlue.id
        home_id = objHomeBaseTeam1.id
    }
}
if current_player = PLAYER2
{
    if instance_exists(objPlayer1)
    {
        enemy_id = objPlayer1.id
        enemy_flag_id = objFlagRed.id
        home_id = objHomeBaseTeam2.id
    } 
}
   
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