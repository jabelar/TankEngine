// intended to be done with an object instance that you're trying to place
while (not place_empty(x, y)) or distance_to_point(128, 128) < 256 or distance_to_point(2848, 2848) < 256
{
    x = (random(room_width) div TILE_SIZE) * TILE_SIZE
    y = (random(room_height) div TILE_SIZE) * TILE_SIZE
}
