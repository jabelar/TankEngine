// adjust surface to match ratio of game
scrSetApplicationSurfaceSize()

switch room
{
    case roomStarting:
    {
        alarm[0]=room_speed
        break;
    }
    case roomMain:
    {
        scrCreateRoom()
        // scale views to application display size
        view_xport[0] = 0
        view_wport[0] = application_width / 2
        view_yport[0] = 0
        view_hport[0] = application_height
        view_xview[0] = 0
        view_wview[0] = application_width
        view_yview[0] = 0
        view_hview[0] = application_height * 2
        
        view_xport[1] = application_width / 2
        view_wport[1] = application_width / 2
        view_yport[1] = 0
        view_hport[1] = application_height
        view_xview[1] = 0
        view_wview[1] = application_width
        view_yview[1] = 0
        view_hview[1] = application_height * 2
        break ;
    }
}
