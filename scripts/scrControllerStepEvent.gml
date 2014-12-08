// behave differently depending on which room you're in (controller is persistent)
switch room
{
    case roomStarting:
    {
        if alarm[0]<0
        {
            room_goto(roomMain)
        }
        break ;
    }
    case roomMain:
    {
        // check for game end conditions
        switch global.game_type
        {
            case VERSUS:
            {
                if global.player_score[PLAYER1] >= 3
                {
                    show_message("Player 1 Wins!")
                    game_restart()
                }
                if global.player_score[PLAYER2] >= 3
                {
                    show_message("Player 2 Wins!")
                    game_restart()
                }
                break ;
            }
            case CAPTURE_THE_FLAG:
            {
                if global.player_score[PLAYER1] >= 3
                {
                    show_message("Player 1 Wins!")
                    game_restart()
                }
                if global.player_score[PLAYER2] >= 3
                {
                    show_message("Player 2 Wins!")
                    game_restart()
                }
                break ;
            }
        }        
        break ;
    }
}
