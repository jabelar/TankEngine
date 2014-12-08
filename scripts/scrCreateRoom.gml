var scaling_factor ;
scaling_factor = room_width * room_height / (4000 * 3000)

// randomize seed
randomize()

// populate deep water
// seed deep water
repeat 30*scaling_factor
{
    map_object_id = instance_create((random(room_width) div 32)*32, (random(room_height) div 32)*32, objWaterDeep) ;
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
            if place_free(x+32,y) then instance_create(x+32, y, objWaterDeep) ;
        }
        // randomly expand left
        if irandom(10) < 3 then
        {
            if place_free(x-32,y) then instance_create(x-32, y, objWaterDeep) ;
        }
        // randomly expand up
        if irandom(10) < 3 then
        {
            if place_free(x,y-32) then instance_create(x, y-32, objWaterDeep) ;
        }
        // randomly expand down
        if irandom(10) < 3 then
        {
            if place_free(x,y+32) then instance_create(x, y+32, objWaterDeep) ;
        }
    }
}
// add shallow water around deep water
with objWaterDeep
{
    if place_empty(x-32, y) then instance_create(x-32, y, objWaterShallow) ;
    if place_empty(x+32, y) then instance_create(x+32, y, objWaterShallow) ;
    if place_empty(x, y-32) then instance_create(x, y-32, objWaterShallow) ;
    if place_empty(x, y+32) then instance_create(x, y+32, objWaterShallow) ;
    if place_empty(x-32, y-32) then instance_create(x-32, y-32, objWaterShallow) ;
    if place_empty(x+32, y-32) then instance_create(x+32, y-32, objWaterShallow) ;
    if place_empty(x-32, y+32) then instance_create(x-32, y+32, objWaterShallow) ;
    if place_empty(x+32, y+32) then instance_create(x+32, y+32, objWaterShallow) ;
}
// add sand around shallow water
with objWaterShallow
{
    if place_empty(x-32, y) then instance_create(x-32, y, objSand) ;
    if place_empty(x+32, y) then instance_create(x+32, y, objSand) ;
    if place_empty(x, y-32) then instance_create(x, y-32, objSand) ;
    if place_empty(x, y+32) then instance_create(x, y+32, objSand) ;
    if place_empty(x-32, y-32) then instance_create(x-32, y-32, objSand) ;
    if place_empty(x+32, y-32) then instance_create(x+32, y-32, objSand) ;
    if place_empty(x-32, y+32) then instance_create(x-32, y+32, objSand) ;
    if place_empty(x+32, y+32) then instance_create(x+32, y+32, objSand) ;
}
// fill in deep water inside corners
with objWaterDeep
{
    if (instance_place(x+32, y+32, objWaterDeep) > 0) and (instance_place(x+32, y, objWaterDeep) = noone) then
    {
        instance_create(x+32, y, objWaterShallow) ;
        instance_create(x+32, y, objWaterDeepTR) ;
    }
    if (instance_place(x-32, y+32, objWaterDeep) > 0) and (instance_place(x-32, y, objWaterDeep) = noone) then
    {
        instance_create(x-32, y, objWaterShallow) ;
        instance_create(x-32, y, objWaterDeepTL) ;
    }
    if (instance_place(x+32, y-32, objWaterDeep) > 0) and (instance_place(x+32, y, objWaterDeep) = noone) then
    {
        instance_create(x+32, y, objWaterShallow) ;
        instance_create(x+32, y, objWaterDeepBR) ;
    }
    if (instance_place(x-32, y-32, objWaterDeep) > 0) and (instance_place(x-32, y, objWaterDeep) = noone) then
    {
        instance_create(x-32, y, objWaterShallow) ;
        instance_create(x-32, y, objWaterDeepBL) ;
    }
}
// round off deep water outside corners
with objWaterDeep
{
   if (instance_place(x+32, y, objWaterDeep) == noone) and (instance_place(x+32, y, objParentWaterDeepInsideCorner) == noone) and (instance_place(x, y-32, objWaterDeep) == noone) and (instance_place(x, y-32, objParentWaterDeepInsideCorner) == noone)  then
   {
        instance_create(x, y, objWaterShallow) ;
        instance_change(objWaterDeepCornerTR, true) ;
    }
}
// turn outside corners into points where appropriate
with objWaterDeepCornerTR
{
    if instance_place(x-32, y, objWaterDeep) == noone and instance_place(x-32, y, objParentWaterDeepInsideCorner) == noone and instance_place(x-32, y, objParentWaterDeepOutsideCorner) == noone then
    {
        instance_change(objWaterDeepPointUp, true) ;
    }
}
// make edges bit rougher
with objWaterDeep
{
    if instance_place(x+32, y, objParentObstacle) == noone then
    {
        instance_create(x, y, objWaterShallow) ;
        instance_change(objWaterDeepEdgeRight, true) ;
    }
    if instance_place(x-32, y, objParentObstacle) == noone and instance_place(x-32, y, objParentWaterDeepEdge) == noone then
    {
        instance_create(x, y, objWaterShallow) ;
        instance_change(objWaterDeepEdgeLeft, true) ;
    }
    if instance_place(x, y+32, objParentObstacle) == noone and instance_place(x, y+32, objParentWaterDeepEdge) == noone then
    {
        instance_create(x, y, objWaterShallow) ;
        instance_change(objWaterDeepEdgeBottom, true) ;
    }
    if instance_place(x, y-32, objParentObstacle) == noone and instance_place(x, y-32, objParentWaterDeepEdge) == noone then
    {
        instance_create(x, y, objWaterShallow) ;
        instance_change(objWaterDeepEdgeTop, true) ;
    }
}

// populate mud
// seed mud
repeat 30*scaling_factor
{
    map_object_id = instance_create((random(room_width) div 32)*32, (random(room_height) div 32)*32, objMud)
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
            if place_free(x+32,y) then instance_create(x+32, y, objMud) ;
        }
        // randomly expand left
        if irandom(10) < 2 then
        {
            if place_free(x-32,y) then instance_create(x-32, y, objMud) ;
        }
        // randomly expand up
        if irandom(10) < 2 then
        {
            if place_free(x,y-32) then instance_create(x, y-32, objMud) ;
        }
        // randomly expand down
        if irandom(10) < 2 then
        {
            if place_free(x,y+32) then instance_create(x, y+32, objMud) ;
        }
    }
}

// populate walls
repeat 100*scaling_factor
{
    map_object_id = instance_create((random(room_width) div 32)*32, (random(room_height) div 32)*32, objObstacleWall1)
    with map_object_id
    {
        scrFindFreeSpace() ;
    }
}

// populate items

repeat 50*scaling_factor
{
    map_object_id = instance_create((random(room_width) div 32)*32, (random(room_height) div 32)*32, objItemHealth)
    with map_object_id
    {
        scrFindFreeSpace() ;
    }
}

repeat 50*scaling_factor
{
    map_object_id = instance_create((random(room_width) div 32)*32, (random(room_height) div 32)*32, objItemAmmo)
    with map_object_id
    {
        scrFindFreeSpace() ;
    }
}
repeat 50*scaling_factor
{
    map_object_id = instance_create((random(room_width) div 32)*32, (random(room_height) div 32)*32, objLandMine)
    with map_object_id
    {
        scrFindFreeSpace() ;
    }
}
