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
            key_forward = true
            break ;
        }
        case ENEMY_FLAG:
        {
            key_forward = true
            break ;
        }
        case HEALTH:
        {
            key_forward = true
            break ;
        }
        case AMMO:
        {
            key_forward = true
            break ;
        }        
    }
}
// show_debug_message("scrProcessAI finished")
