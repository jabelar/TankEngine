// intended to be done with an object instance that you're trying to place
while (not place_empty(x, y)) or distance_to_object(objHomeBaseTeam1) < TILE_SIZE*2 or distance_to_object(objHomeBaseTeam2) < TILE_SIZE*2
{
    x = (random(room_width) div TILE_SIZE) * TILE_SIZE
    y = (random(room_height) div TILE_SIZE) * TILE_SIZE
}