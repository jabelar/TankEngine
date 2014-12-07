draw_healthbar(x-32, y-16-30, x-32+64, y-16-25, my_health, c_black, c_red, c_green, 0, true, true)
draw_sprite_ext(body_sprite, image_index, x, y, 1, 1, image_angle, c_white, 1)
// draw weapons
if has_main_gun then draw_sprite_ext(sprTankMainGun, 0, x, y, 1, 1, image_angle, c_white, 1)var direction_to_home ;
// draw indicators
if view_current = current_player // only draw in players view
{
    // home indicator
    direction_to_home = point_direction(x, y, xstart, ystart)
    if point_distance(x, y, xstart, ystart) > 100
    {
        draw_sprite_ext(sprIndicatorArrow, 0, x+lengthdir_x(100, direction_to_home), y+lengthdir_y(100, direction_to_home), 1, 1, direction_to_home, c_white, 0.4)
    }
    // nearest enemy indicator
    var direction_to_enemy, enemy_id, other_type ;
    if current_player = PLAYER1 then other_type = objPlayer2 else other_type = objPlayer1
    enemy_id = instance_nearest(x, y, other_type)
    if enemy_id > 0 // there is at least one enemy
    {
        direction_to_enemy = point_direction(x, y, enemy_id.x, enemy_id.y)
        if point_distance(x, y, enemy_id.x, enemy_id.y) > 300
        {
            draw_sprite_ext(sprIndicatorArrow, 0, x+lengthdir_x(100, direction_to_enemy), y+lengthdir_y(100, direction_to_enemy), 1, 1, direction_to_enemy, c_red, 0.2)
        }
    }
} 
// debug messages
// draw_text(x, y-100, ai_target)
// draw_text(x, y-50, alarm[1])
// draw_text(x, y-20, have_enemy_flag)
