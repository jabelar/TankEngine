// intended to be done with an object instance that you're trying to place
while not (place_empty(x, y) or distance_to_point(128, 128) < 256 or distance_to_point(2848, 2848) < 256)
{
    x = (random(room_width) div 32) * 32
    y = (random(room_height) div 32) * 32
}
