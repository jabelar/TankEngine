show_debug_message("scrPlayerAlarm1Event starting")
// this is the AI decision making script

// update motion planning path
if (enemy_id != noone)
{
    mp_potential_path_object(path, enemy_id.x, enemy_id.y, my_speed, 4, objParentObstacle)
    // path_start(path, my_speed, 0, false);
}

// if it sees player then target it but only if you have ammo
if global.ammo_main_gun[PLAYER2] <= 0 // go for ammo if ammo is low
{
    ai_target = AMMO
}
else if distance_to_object(objPlayer1) < 16*room_speed // see enemy
{
    ai_target = ENEMY
}
else if have_enemy_flag
{
    ai_target = HOME
}
else if global.ammo_main_gun[PLAYER2] < 10 // go for ammo if ammo is low
{
    ai_target = AMMO
}
else if my_health < 70 // go for health if health is low
{
    ai_target = HEALTH
}
else // go for enemy flag
{
    ai_target = ENEMY_FLAG
}

// reset alarm
alarm[1] = room_speed // once per second
show_debug_message("scrPlayerAlarm1Event finished")
