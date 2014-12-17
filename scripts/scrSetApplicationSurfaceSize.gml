// got this from https://www.yoyogames.com/tech_blog/80
application_width = display_get_width()
application_height = display_get_height()
surface_resize(application_surface, application_width, application_height)

show_debug_message("Application size = "+string(application_width)+" by "+string(application_height))