item_id = instance_place(x, y, objItemHealth)
if item_id > 0 // hit item
{
    my_health += 20
    if my_health > 100 then my_health = 100
    audio_play_sound(sndItem, 1, false)
    with (item_id)
    {
        instance_destroy()
    }
    // respawn in random location
    new_item_id = instance_create(random(room_width), random(room_height), objItemHealth)
    // make sure in free location
    with (new_item_id)
    {
        while (not place_free(x, y))
        {
            x = random(room_width)
            y = random(room_height)
        }
    }
}

item_id = instance_place(x, y, objItemAmmo)
if item_id > 0 // hit item
{
    global.ammo_main_gun[current_player] += 10
    audio_play_sound(sndItem, 1, false)
    with (item_id)
    {
        instance_destroy()
    }
      // respawn in random location
    new_item_id = instance_create(random(room_width), random(room_height), objItemAmmo)
    // make sure in free location
    with (new_item_id)
    {
        while (not place_free(x, y))
        {
            x = random(room_width)
            y = random(room_height)
        }
    }
}

switch global.game_type
{
    case VERSUS:
    {
        // do nothing
        break ;
    }
    case CAPTURE_THE_FLAG:
    {
        // figure out which flag is which
        if current_player = PLAYER1
        {
            own_flag_id = objFlagRed.id
            enemy_flag_id = objFlagBlue.id
        }
        else // player 2
        {
            own_flag_id = objFlagBlue.id
            enemy_flag_id = objFlagRed.id
        }
        
        // check if hit own flag
        //flag_id = instance_place(x, y, own_flag_id)
        //if flag_id > 0 // hit own flag
        //{
        //    switch flag_id.state
        //    {
        //        case FLAG_HOME:
        //        {   
        //            // do nothing
        //            break ;
        //        }
        //        case FLAG_CAPTURED:
        //        {
        //            // do nothing
        //            break ;
        //        }
        //        case FLAG_ABANDONED:
        //        {
        //            audio_play(sndFlag, 1, false)
        //            flag_id.state = FLAG_RETURNING
        //            have_own_flag = true
        //            flag_id.carrier = id
        //            break ;
        //        }
        //        case FLAG_RETURNING:
       //         {
        //            // do nothing
        //            break ;
        //        }
        //    }
        //}
        
        // check if hit enemy flag
        flag_id = instance_place(x, y, enemy_flag_id)
        if flag_id > 0 // hit enemy flag
        {
            switch flag_id.state
            {
                case FLAG_HOME:
                {
                    // pick it up
                    audio_play_sound(sndFlag, 1, false)
                    flag_id.state = FLAG_CAPTURED
                    have_enemy_flag = true
                    flag_id.carrier = id
                    break ;
                }
                case FLAG_CAPTURED:
                {
                    // do nothing
                    break ;
                }
                case FLAG_ABANDONED:
                {
                    // pick it up
                    audio_play_sound(sndFlag, 1, false)
                    flag_id.state = FLAG_CAPTURED
                    have_enemy_flag = true
                    flag_id.carrier = id
                    break ;
                }
                case FLAG_RETURNING:
                {
                    // do nothing
                    break ;
                }
            }
        }
        
        hazard_id = instance_place(x, y, objParentHazard)
        if hazard_id > 0 // hit hazard
        {
            state = DYING
            if hazard_id.object_index = objLandMine
            {
                with (hazard_id)
                {
                    instance_destroy()
                }
            }
        }
        
        base_id = instance_place(x, y, objParentBase)
        if base_id > 0 // hit home base
        {
            // check if enemy or own base
            if base_id.my_team = my_team // our own base
            {
                // deposit any returning or captured flag
                with (objParentFlag)
                {
                    // check if being carried by this tank
                    if carrier = other.id 
                    {
                        if state = FLAG_CAPTURED
                        {
                            global.player_score[other.current_player] += 1
                            audio_play_sound(sndFanfare, 1, false)
                            state = FLAG_HOME
                            carrier = noone
                            other.have_enemy_flag = false
                            // return it to starting position
                            x = xstart
                            y = ystart
                        }
                        //else if state = FLAG_RETURNING
                        //{
                        //    state = FLAG_HOME
                        //    carrier = noone
                        //    other.have_own_flag = false
                            // return it to starting position
                        //    x = xstart
                        //    y = ystart
                        //}
                    }
                }
            }
            else // enemy base
            {
                // do nothing
            }
        }    
        break ;
    }
}