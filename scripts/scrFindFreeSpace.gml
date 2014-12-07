// intended to be done with an object instance that you're trying to place
while not place_empty(x, y)
{
    x = (random(room_width) div 32) * 32
    y = (random(room_height) div 32) * 32
}
