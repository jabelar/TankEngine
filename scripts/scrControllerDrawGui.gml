if room = roomMain
{
    draw_set_color(c_yellow)
    draw_text(5, 5, "Score = "+string(global.player_score[PLAYER1]))
    draw_text(5, 35, "Ammo = "+string(global.ammo_main_gun[PLAYER1]))
    draw_text(display_get_gui_width()/2+5, 5, "Score = "+string(global.player_score[PLAYER2]))
    draw_text(display_get_gui_width()/2+5, 35, "Ammo = "+string(global.ammo_main_gun[PLAYER2]))
}