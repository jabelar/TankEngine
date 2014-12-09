var scaling_factor ;
scaling_factor = room_width * room_height / (12000 * 12000)
show_debug_message("room_width = "+string(room_width))
show_debug_message("room_height = "+string(room_height))

// randomize seed
randomize()

// spawn players
home_base_id_1 = instance_create(TILE_SIZE*3, TILE_SIZE*3, objHomeBaseTeam1)
home_base_id_2 = instance_create(room_width-TILE_SIZE*3, room_height-TILE_SIZE*3, objHomeBaseTeam2)
instance_create(home_base_id_1.x, home_base_id_1.y, objFlagRed)
instance_create(home_base_id_1.x, home_base_id_1.y, objPlayer1)
instance_create(home_base_id_2.x, home_base_id_2.y, objFlagBlue)
instance_create(home_base_id_2.x, home_base_id_2.y, objPlayer2)

// populate deep water
// seed deep water
repeat 30*scaling_factor
{
    map_object_id = instance_create((random(room_width) div TILE_SIZE)*TILE_SIZE, (random(room_height) div TILE_SIZE)*TILE_SIZE, objWaterDeep) ;
    with map_object_id
    {
        scrFindFreeSpace() ;
    }
}
// expand deep water
repeat 6
{
    with objWaterDeep
    {
        // randomly expand right
        if irandom(10) < 3 then
        {
            if place_free(x+TILE_SIZE,y) then instance_create(x+TILE_SIZE, y, objWaterDeep) ;
        }
        // randomly expand left
        if irandom(10) < 3 then
        {
            if place_free(x-TILE_SIZE,y) then instance_create(x-TILE_SIZE, y, objWaterDeep) ;
        }
        // randomly expand up
        if irandom(10) < 3 then
        {
            if place_free(x,y-TILE_SIZE) then instance_create(x, y-TILE_SIZE, objWaterDeep) ;
        }
        // randomly expand down
        if irandom(10) < 3 then
        {
            if place_free(x,y+TILE_SIZE) then instance_create(x, y+TILE_SIZE, objWaterDeep) ;
        }
    }
}
// add shallow water around deep water
with objWaterDeep
{
    if place_empty(x-TILE_SIZE, y) then instance_create(x-TILE_SIZE, y, objWaterShallow) ;
    if place_empty(x+TILE_SIZE, y) then instance_create(x+TILE_SIZE, y, objWaterShallow) ;
    if place_empty(x, y-TILE_SIZE) then instance_create(x, y-TILE_SIZE, objWaterShallow) ;
    if place_empty(x, y+TILE_SIZE) then instance_create(x, y+TILE_SIZE, objWaterShallow) ;
    if place_empty(x-TILE_SIZE, y-TILE_SIZE) then instance_create(x-TILE_SIZE, y-TILE_SIZE, objWaterShallow) ;
    if place_empty(x+TILE_SIZE, y-TILE_SIZE) then instance_create(x+TILE_SIZE, y-TILE_SIZE, objWaterShallow) ;
    if place_empty(x-TILE_SIZE, y+TILE_SIZE) then instance_create(x-TILE_SIZE, y+TILE_SIZE, objWaterShallow) ;
    if place_empty(x+TILE_SIZE, y+TILE_SIZE) then instance_create(x+TILE_SIZE, y+TILE_SIZE, objWaterShallow) ;
}
// add sand around shallow water
with objWaterShallow
{
    if place_empty(x-TILE_SIZE, y) then instance_create(x-TILE_SIZE, y, objSand) ;
    if place_empty(x+TILE_SIZE, y) then instance_create(x+TILE_SIZE, y, objSand) ;
    if place_empty(x, y-TILE_SIZE) then instance_create(x, y-TILE_SIZE, objSand) ;
    if place_empty(x, y+TILE_SIZE) then instance_create(x, y+TILE_SIZE, objSand) ;
    if place_empty(x-TILE_SIZE, y-TILE_SIZE) then instance_create(x-TILE_SIZE, y-TILE_SIZE, objSand) ;
    if place_empty(x+TILE_SIZE, y-TILE_SIZE) then instance_create(x+TILE_SIZE, y-TILE_SIZE, objSand) ;
    if place_empty(x-TILE_SIZE, y+TILE_SIZE) then instance_create(x-TILE_SIZE, y+TILE_SIZE, objSand) ;
    if place_empty(x+TILE_SIZE, y+TILE_SIZE) then instance_create(x+TILE_SIZE, y+TILE_SIZE, objSand) ;
}
// fill in deep water inside corners
with objWaterDeep
{
    if (instance_place(x+TILE_SIZE, y+TILE_SIZE, objWaterDeep) > 0) and (instance_place(x+TILE_SIZE, y, objWaterDeep) = noone) then
    {
        instance_create(x+TILE_SIZE, y, objWaterShallow) ;
        instance_create(x+TILE_SIZE, y, objWaterDeepTR) ;
    }
    if (instance_place(x-TILE_SIZE, y+TILE_SIZE, objWaterDeep) > 0) and (instance_place(x-TILE_SIZE, y, objWaterDeep) = noone) then
    {
        instance_create(x-TILE_SIZE, y, objWaterShallow) ;
        instance_create(x-TILE_SIZE, y, objWaterDeepTL) ;
    }
    if (instance_place(x+TILE_SIZE, y-TILE_SIZE, objWaterDeep) > 0) and (instance_place(x+TILE_SIZE, y, objWaterDeep) = noone) then
    {
        instance_create(x+TILE_SIZE, y, objWaterShallow) ;
        instance_create(x+TILE_SIZE, y, objWaterDeepBR) ;
    }
    if (instance_place(x-TILE_SIZE, y-TILE_SIZE, objWaterDeep) > 0) and (instance_place(x-TILE_SIZE, y, objWaterDeep) = noone) then
    {
        instance_create(x-TILE_SIZE, y, objWaterShallow) ;
        instance_create(x-TILE_SIZE, y, objWaterDeepBL) ;
    }
}
// round off deep water outside corners
with objWaterDeep
{
   if (instance_place(x+TILE_SIZE, y, objWaterDeep) == noone) and (instance_place(x+TILE_SIZE, y, objParentWaterDeepInsideCorner) == noone) and (instance_place(x, y-TILE_SIZE, objWaterDeep) == noone) and (instance_place(x, y-TILE_SIZE, objParentWaterDeepInsideCorner) == noone)  then
   {
        instance_create(x, y, objWaterShallow) ;
        instance_change(objWaterDeepCornerTR, true) ;
    }
}
// turn outside corners into points where appropriate
with objWaterDeepCornerTR
{
    if instance_place(x-TILE_SIZE, y, objWaterDeep) == noone and instance_place(x-TILE_SIZE, y, objParentWaterDeepInsideCorner) == noone and instance_place(x-TILE_SIZE, y, objParentWaterDeepOutsideCorner) == noone then
    {
        instance_change(objWaterDeepPointUp, true) ;
    }
}
// make edges bit rougher
with objWaterDeep
{
    if instance_place(x+TILE_SIZE, y, objParentObstacle) == noone then
    {
        instance_create(x, y, objWaterShallow) ;
        instance_change(objWaterDeepEdgeRight, true) ;
    }
    if instance_place(x-TILE_SIZE, y, objParentObstacle) == noone and instance_place(x-TILE_SIZE, y, objParentWaterDeepEdge) == noone then
    {
        instance_create(x, y, objWaterShallow) ;
        instance_change(objWaterDeepEdgeLeft, true) ;
    }
    if instance_place(x, y+TILE_SIZE, objParentObstacle) == noone and instance_place(x, y+TILE_SIZE, objParentWaterDeepEdge) == noone then
    {
        instance_create(x, y, objWaterShallow) ;
        instance_change(objWaterDeepEdgeBottom, true) ;
    }
    if instance_place(x, y-TILE_SIZE, objParentObstacle) == noone and instance_place(x, y-TILE_SIZE, objParentWaterDeepEdge) == noone then
    {
        instance_create(x, y, objWaterShallow) ;
        instance_change(objWaterDeepEdgeTop, true) ;
    }
}

// populate mud
// seed mud
repeat 30*scaling_factor
{
    map_object_id = instance_create((random(room_width) div TILE_SIZE)*TILE_SIZE, (random(room_height) div TILE_SIZE)*TILE_SIZE, objMud)
    with map_object_id
    {
        scrFindFreeSpace() ;
    }
}
// expand mud
repeat 6
{
    with objMud
    {
        // randomly expand right
        if irandom(10) < 2 then
        {
            if place_free(x+TILE_SIZE,y) then instance_create(x+TILE_SIZE, y, objMud) ;
        }
        // randomly expand left
        if irandom(10) < 2 then
        {
            if place_free(x-TILE_SIZE,y) then instance_create(x-TILE_SIZE, y, objMud) ;
        }
        // randomly expand up
        if irandom(10) < 2 then
        {
            if place_free(x,y-TILE_SIZE) then instance_create(x, y-TILE_SIZE, objMud) ;
        }
        // randomly expand down
        if irandom(10) < 2 then
        {
            if place_free(x,y+TILE_SIZE) then instance_create(x, y+TILE_SIZE, objMud) ;
        }
    }
}

// populate walls
repeat 100*scaling_factor
{
    map_object_id = instance_create((random(room_width) div TILE_SIZE)*TILE_SIZE, (random(room_height) div TILE_SIZE)*TILE_SIZE, objObstacleWall1)
    with map_object_id
    {
        scrFindFreeSpace() ;
    }
}

// populate items

repeat 50*scaling_factor
{
    map_object_id = instance_create((random(room_width) div TILE_SIZE)*TILE_SIZE, (random(room_height) div TILE_SIZE)*TILE_SIZE, objItemHealth)
    with map_object_id
    {
        scrFindFreeSpace() ;
    }
}

repeat 50*scaling_factor
{
    map_object_id = instance_create((random(room_width) div TILE_SIZE)*TILE_SIZE, (random(room_height) div TILE_SIZE)*TILE_SIZE, objItemAmmo)
    with map_object_id
    {
        scrFindFreeSpace() ;
    }
}
repeat 50*scaling_factor
{
    map_object_id = instance_create((random(room_width) div TILE_SIZE)*TILE_SIZE, (random(room_height) div TILE_SIZE)*TILE_SIZE, objLandMine)
    with map_object_id
    {
        scrFindFreeSpace() ;
    }
}
