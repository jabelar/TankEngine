// show_debug_message("scrProcessTankMovement starting")
// process movement
// don't move if DYING
if state == DYING then 
{
// do nothing
}
else
{
    image_speed = 0 ;
    
    // slow down if in mud or shallow water
    if instance_place(x, y, objParentHindrance) then
    {
        current_speed = my_speed * 0.5 ;
        current_turn_speed = my_turn_speed * 0.25 ;
    }
    else
    {
        current_speed = my_speed ;
        current_turn_speed = my_turn_speed ;
    }
    
    if key_forward
    {
        if player_type = HUMAN
        {
            move_contact_solid(direction, current_speed) ;
        }
        else // computer player
        {
            path_speed = current_speed
            
            switch ai_target
            {
                case ENEMY:
                {
                    dir_to_enemy = point_direction(x, y, enemy_id.x, enemy_id.y)
                    if abs(angle_difference(dir_to_enemy, direction+angle_main_gun)) < TANK_TURN_SPEED_BASE*TANK_TURRET_SPEED_MULTIPLIER
                    {
                        // clamp angle to direction
                        angle_main_gun = dir_to_enemy-direction
                    }
                    else // need to turn
                    {
                        angle_main_gun += sign(angle_difference(dir_to_enemy, direction+angle_main_gun))*TANK_TURN_SPEED_BASE*TANK_TURRET_SPEED_MULTIPLIER
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
        tracks_id = instance_create(x, y, objTracks) ;
        tracks_id.image_angle = image_angle ;
        image_speed = 2 ;
    }
    else // not moving forward
    {
        if player_type == COMPUTER
        {
            path_speed = 0
        }
    }
    
    if key_backward
    {
        move_contact_solid(direction+180, current_speed/2) ;
        tracks_id = instance_create(x, y, objTracks) ;
        tracks_id.image_angle = image_angle ;
        image_speed = -1 ;
    }
    
    if key_right
    {
        if player_type == HUMAN
        {
            direction -= current_turn_speed ;
            image_angle = direction ;
            // but don't turn into an obstacle
            if instance_place(x, y, objParentObstacle)
            {
                // revert the turn
                direction += current_turn_speed ;
                image_angle = direction ;
            }
        }
        else // computer player
        {
            image_angle -= current_turn_speed
        }
    }
    
    if key_left
    {
        if player_type == HUMAN
        {
            direction += current_turn_speed ;
            image_angle = direction ;
            // but don't turn into an obstacle
            if instance_place(x, y, objParentObstacle)
            {
                // revert the turn
                direction -= current_turn_speed ;
                image_angle = direction ;
            }
        }
        else // computer player
        {
            image_angle += current_turn_speed
        }
    }
    
    // keep in room (assumes origin is centered)
    if x < 0 then x = 0 ;
    if x > room_width then x = room_width ;
    if y < 0 then y = 0 ;
    if y > room_height then y = room_height ;
}

// show_debug_message("scrProcessTankMovement finished")
