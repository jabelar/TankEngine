// show_debug_message("scrPlayerAlarm1Event starting")
// this is the AI decision making script

// update motion planning path
if (enemy_id != noone)
{
    mp_potential_path_object(path, enemy_id.x, enemy_id.y, my_speed, 4, objParentObstacle)
    // path_start(path, my_speed, 0, false);
}
scrProcessEnvironment()

// if it sees player then target it but only if you have ammo
if global.ammo_main_gun[PLAYER2] <= 0 // go for ammo if ammo is completely out
{
    ai_target = AMMO
    path_found = mp_grid_path(grid, path, x, y, nearest_ammo_id.x, nearest_ammo_id.y, true)
    show_debug_message("Path found = "+string(path_found)+" and Path length ="+string(path_get_length(path)))
    if path_found
    {
        path_start(path, current_speed, 0, false)
        prev_ai_target = ai_target
        xpathstart = x
        ypathstart = y
    }
}
else if distance_to_object(objPlayer1) < 6*TILE_SIZE // see enemy
{
    ai_target = ENEMY
    path_found = mp_grid_path(grid, path, x, y, enemy_id.x, enemy_id.y, true)
    show_debug_message("Path found = "+string(path_found)+" and Path length ="+string(path_get_length(path)))
    if path_found
    {
        path_start(path, current_speed, 0, false)
        prev_ai_target = ai_target
        xpathstart = x
        ypathstart = y
    }
}
else if have_enemy_flag
{
    ai_target = HOME
    path_found = mp_grid_path(grid, path, x, y, home_id.x, home_id.y, true)
    show_debug_message("Path found = "+string(path_found)+" and Path length ="+string(path_get_length(path)))
    if path_found
    {
        path_start(path, current_speed, 0, false)
        prev_ai_target = ai_target
        xpathstart = x
        ypathstart = y
    }
}
else if global.ammo_main_gun[PLAYER2] < 10 // go for ammo if ammo is low
{
    ai_target = AMMO
    path_found = mp_grid_path(grid, path, x, y, nearest_ammo_id.x, nearest_ammo_id.y, true)
    show_debug_message("Path found = "+string(path_found)+" and Path length ="+string(path_get_length(path)))
    if path_found
    {
        path_start(path, current_speed, 0, false)
        prev_ai_target = ai_target
        xpathstart = x
        ypathstart = y
    }
}
else if my_health < 70 // go for health if health is low
{
    ai_target = HEALTH
    path_found = mp_grid_path(grid, path, x, y, nearest_health_id.x, nearest_health_id.y, true)
    show_debug_message("Path found = "+string(path_found)+" and Path length ="+string(path_get_length(path)))
    if path_found
    {
        path_start(path, current_speed, 0, false)
        prev_ai_target = ai_target
        xpathstart = x
        ypathstart = y
    }
}
else // go for enemy flag
{
    ai_target = ENEMY_FLAG
    path_found = mp_grid_path(grid, path, x, y, enemy_flag_id.x, enemy_flag_id.y, true)
    show_debug_message("Path found = "+string(path_found)+" and Path length ="+string(path_get_length(path)))
    if path_found
    {
        path_start(path, current_speed, 0, false)
        prev_ai_target = ai_target
        xpathstart = x
        ypathstart = y
    }
}

// reset alarm
alarm[1] = room_speed // once per second
// show_debug_message("scrPlayerAlarm1Event finished")
