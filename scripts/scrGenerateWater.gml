var expansion_factor = argument0

show_debug_message("Populating deep water")
// populate deep water
// seed deep water
repeat OBJ_DENSITY*scaling_factor
{
    map_object_id = instance_create((random(room_width) div TILE_SIZE)*TILE_SIZE, (random(room_height) div TILE_SIZE)*TILE_SIZE, objWaterDeep) ;
    with map_object_id
    {
        scrFindFreeSpace() ;
    }
}

show_debug_message("Expanding deep water")
// expand deep water
repeat expansion_factor
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

show_debug_message("Adding shallow water")
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

show_debug_message("Adding sand")
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

show_debug_message("Filling in deep water corners")
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
show_debug_message("Rounding out deep water outside corners")
// round off deep water outside corners
with objWaterDeep
{
   if (instance_place(x+TILE_SIZE, y, objWaterDeep) == noone) and (instance_place(x+TILE_SIZE, y, objParentWaterDeepInsideCorner) == noone) and (instance_place(x, y-TILE_SIZE, objWaterDeep) == noone) and (instance_place(x, y-TILE_SIZE, objParentWaterDeepInsideCorner) == noone)  then
   {
        instance_create(x, y, objWaterShallow) ;
        instance_change(objWaterDeepCornerTR, true) ;
   }
   if (instance_place(x-TILE_SIZE, y, objWaterDeep) == noone) and (instance_place(x-TILE_SIZE, y, objParentWaterDeepInsideCorner) == noone) and (instance_place(x, y-TILE_SIZE, objWaterDeep) == noone) and (instance_place(x, y-TILE_SIZE, objParentWaterDeepInsideCorner) == noone)  then
   {
        instance_create(x, y, objWaterShallow) ;
        instance_change(objWaterDeepCornerTL, true) ;
   }
   if (instance_place(x+TILE_SIZE, y, objWaterDeep) == noone) and (instance_place(x+TILE_SIZE, y, objParentWaterDeepInsideCorner) == noone) and (instance_place(x, y+TILE_SIZE, objWaterDeep) == noone) and (instance_place(x, y+TILE_SIZE, objParentWaterDeepInsideCorner) == noone)  then
   {
        instance_create(x, y, objWaterShallow) ;
        instance_change(objWaterDeepCornerBR, true) ;
   }
   if (instance_place(x-TILE_SIZE, y, objWaterDeep) == noone) and (instance_place(x-TILE_SIZE, y, objParentWaterDeepInsideCorner) == noone) and (instance_place(x, y+TILE_SIZE, objWaterDeep) == noone) and (instance_place(x, y+TILE_SIZE, objParentWaterDeepInsideCorner) == noone)  then
   {
        instance_create(x, y, objWaterShallow) ;
        instance_change(objWaterDeepCornerBL, true) ;
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