// show_debug_message("scrProcessTankMovement starting")
// process movement
// don't move if DYING
if state = DYING then 
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
    else
    {
        path_speed = current_speed
        switch ai_target
        {
            case ENEMY:
            {
//                mp_potential_step(enemy_id.x, enemy_id.y, current_speed, false)
                break ;
            }
            case HOME:
            {
//                mp_potential_step(home_id.x, home_id.y, current_speed, false)
                break ;
            }   
            case ENEMY_FLAG:
            {
//                mp_potential_step(enemy_flag_id.x, enemy_flag_id.y, current_speed, false)
                break ;
            }   
            case HEALTH:
            {
//                mp_potential_step(nearest_health_id.x, nearest_health_id.y, current_speed, false)
                break ;
            }
            case AMMO:
            {
//                mp_potential_step(nearest_ammo_id.x, nearest_ammo_id.y, current_speed, false)
                break ;
            }
        }
    }
    tracks_id = instance_create(x, y, objTracks) ;
    tracks_id.image_angle = image_angle ;
    image_speed = 2 ;
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
if key_left
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
// keep in room (assumes origin is centered)
if x < 0 then x = 0 ;
if x > room_width then x = room_width ;
if y < 0 then y = 0 ;
if y > room_height then y = room_height ;
}

// show_debug_message("scrProcessTankMovement finished")
