// show_debug_message("scrPlayerAlarm1Event starting")
// this is the AI decision making script

scrProcessEnvironment()

// if it sees player then target it but only if you have ammo
if global.ammo_main_gun[PLAYER2] <= 0 // go for ammo if ammo is low
{
    ai_target = AMMO
//    if ai_target != prev_ai_target
    {
        path_found = mp_grid_path(grid, path, x, y, nearest_ammo_id.x, nearest_ammo_id.y, true)
        path_start(path, my_speed, 0, false)
        prev_ai_target = ai_target
        xpathstart = x
        ypathstart = y
        show_debug_message("Path found = "+string(path_found)+" and Path length ="+string(path_get_length(path)))
    }
}
else if distance_to_object(objPlayer1) < 6*TILE_SIZE // see enemy
{
    ai_target = ENEMY
//    if ai_target != prev_ai_target
    {
        path_found = mp_grid_path(grid, path, x, y, enemy_id.x, enemy_id.y, true)
        path_start(path, my_speed, 0, false)
        prev_ai_target = ai_target
        xpathstart = x
        ypathstart = y
        show_debug_message("Path found = "+string(path_found)+" and Path length ="+string(path_get_length(path)))
    }
}
else if have_enemy_flag
{
    ai_target = HOME
//    if ai_target != prev_ai_target
    {
        path_found = mp_grid_path(grid, path, x, y, home_id.x, home_id.y, true)
        path_start(path, my_speed, 0, false)
        prev_ai_target = ai_target
        xpathstart = x
        ypathstart = y
        show_debug_message("Path found = "+string(path_found)+" and Path length ="+string(path_get_length(path)))
    }
}
else if global.ammo_main_gun[PLAYER2] < 10 // go for ammo if ammo is low
{
    ai_target = AMMO
//    if ai_target != prev_ai_target
    {
        path_found = mp_grid_path(grid, path, x, y, nearest_ammo_id.x, nearest_ammo_id.y, true)
        path_start(path, my_speed, 0, false)
        prev_ai_target = ai_target
        xpathstart = x
        ypathstart = y
        show_debug_message("Path found = "+string(path_found)+" and Path length ="+string(path_get_length(path)))
    }
}
else if my_health < 70 // go for health if health is low
{
    ai_target = HEALTH
//    if ai_target != prev_ai_target
    {
        path_found = mp_grid_path(grid, path, x, y, nearest_health_id.x, nearest_health_id.y, true)
        path_start(path, my_speed, 0, false)
        prev_ai_target = ai_target
        xpathstart = x
        ypathstart = y
        show_debug_message("Path found = "+string(path_found)+" and Path length ="+string(path_get_length(path)))
    }}
else // go for enemy flag
{
    ai_target = ENEMY_FLAG
//    if ai_target != prev_ai_target
    {
        path_found = mp_grid_path(grid, path, x, y, enemy_flag_id.x, enemy_flag_id.y, true)
        path_start(path, my_speed, 0, false)
        prev_ai_target = ai_target
        xpathstart = x
        ypathstart = y
        show_debug_message("Path found = "+string(path_found)+" and Path length ="+string(path_get_length(path)))
    }
}

// reset alarm
alarm[1] = room_speed // once per second
// show_debug_message("scrPlayerAlarm1Event finished")
