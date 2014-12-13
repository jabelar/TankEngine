// got this from https://www.yoyogames.com/tech_blog/80
var base_w = room_width
var base_h = room_height
var aspect = base_w / base_h  // get the GAME aspect ratio
//assumes landscape
var hh = min(base_h, display_get_height())
var ww = hh * aspect
surface_resize(application_surface, ww, hh)
