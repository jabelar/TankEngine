// process weapons
if key_weapon1_pressed
{
    if alarm[0] < 1
    {
        if global.ammo_main_gun[current_player] > 0
        {
            sound_play(sndMainGun)
            bullet_id = instance_create(x+lengthdir_x(offset_distance_main_gun, image_angle+offset_angle_main_gun), y+lengthdir_y(offset_distance_main_gun, image_angle+offset_angle_main_gun), objProjectileShell)
            bullet_id.direction = image_angle
            bullet_id.image_angle = image_angle
            bullet_id.my_player = current_player
            global.ammo_main_gun[current_player] -= 1
            alarm[0] = MAIN_GUN_DELAY
            // recoil effect
            move_contact_solid(direction+180, 4)
        }
    }
}