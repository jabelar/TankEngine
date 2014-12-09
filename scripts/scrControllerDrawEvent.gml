draw_set_font(fontMilitaryStencil)
draw_set_color(c_yellow)
switch room
{
    case roomStarting:
    {
        break ;
    }
    case roomMain:
    {
        if view_current = 0
        {
            draw_text(view_xview[0]+5, view_yview[0]+5, "Score = "+string(global.player_score[PLAYER1]))
            draw_text(view_xview[0]+5, view_yview[0]+35, "Ammo = "+string(global.ammo_main_gun[PLAYER1]))
            draw_set_color(c_black)
            draw_rectangle(view_xview[0]+view_wview[0]-5, view_yview[0], view_xview[0]+view_wview[0], view_yview[0]+view_hview[0], false)
        }
        if view_current = 1
        {
            draw_text(view_xview[1]+5, view_yview[1]+5, "Score = "+string(global.player_score[PLAYER2]))
            draw_text(view_xview[1]+5, view_yview[1]+35, "Ammo = "+string(global.ammo_main_gun[PLAYER2]))
        }
        break ;
    }
}