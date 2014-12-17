var expansion_factor = argument0

show_debug_message("Populating mud")
// populate mud
// seed mud
repeat OBJ_DENSITY*scaling_factor
{
    map_object_id = instance_create((random(room_width) div TILE_SIZE)*TILE_SIZE, (random(room_height) div TILE_SIZE)*TILE_SIZE, objMud)
    with map_object_id
    {
        scrFindFreeSpace() ;
    }
}
show_debug_message("Expanding mud")
// expand mud
repeat expansion_factor
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
show_debug_message("Filling in mud corners")
// fill in mud inside corners
with objMud
{
    if (instance_place(x+TILE_SIZE, y+TILE_SIZE, objMud) > 0) and (instance_place(x+TILE_SIZE, y, objMud) == noone) then
    {
        instance_create(x+TILE_SIZE, y, objMudTR) 
    }
    if (instance_place(x-TILE_SIZE, y+TILE_SIZE, objMud) > 0) and (instance_place(x-TILE_SIZE, y, objMud) == noone) then
    {
        instance_create(x-TILE_SIZE, y, objMudTL) 
    }
    if (instance_place(x+TILE_SIZE, y-TILE_SIZE, objMud) > 0) and (instance_place(x+TILE_SIZE, y, objMud) == noone) then
    {
        instance_create(x+TILE_SIZE, y, objMudBR) 
    }
    if (instance_place(x-TILE_SIZE, y-TILE_SIZE, objMud) > 0) and (instance_place(x-TILE_SIZE, y, objMud) == noone) then
    {
        instance_create(x-TILE_SIZE, y, objMudBL) ;
    }
}

// make edges bit rougher
with objMud
{
    if instance_place(x+TILE_SIZE, y, objParentHindrance) == noone then
    {
        instance_change(objMudEdgeRight, true) ;
    }
    if instance_place(x-TILE_SIZE, y, objParentHindrance) == noone and instance_place(x-TILE_SIZE, y, objParentWaterDeepEdge) == noone then
    {
        instance_change(objMudEdgeLeft, true) ;
    }
    if instance_place(x, y+TILE_SIZE, objParentHindrance) == noone and instance_place(x, y+TILE_SIZE, objParentWaterDeepEdge) == noone then
    {
        instance_change(objMudEdgeBottom, true) ;
    }
    if instance_place(x, y-TILE_SIZE, objParentHindrance) == noone and instance_place(x, y-TILE_SIZE, objParentWaterDeepEdge) == noone then
    {
        instance_change(objMudEdgeTop, true) ;
    }
}
show_debug_message("Rounding out mud outside corners")
// round off mud outside corners
with objMud
{
   if (instance_place(x+TILE_SIZE, y, objMud) == noone) and (instance_place(x+TILE_SIZE, y, objParentMudInsideCorner) == noone) and (instance_place(x, y-TILE_SIZE, objMud) == noone) and (instance_place(x, y-TILE_SIZE, objParentMudInsideCorner) == noone)  
   {
        instance_change(objMudCornerTR, true) 
   }
   if (instance_place(x-TILE_SIZE, y, objMud) == noone) and (instance_place(x-TILE_SIZE, y, objParentMudInsideCorner) == noone) and (instance_place(x, y-TILE_SIZE, objMud) == noone) and (instance_place(x, y-TILE_SIZE, objParentMudInsideCorner) == noone)  
   {
        instance_change(objMudCornerTL, true) 
   }   
   if (instance_place(x+TILE_SIZE, y, objMud) == noone) and (instance_place(x+TILE_SIZE, y, objParentMudInsideCorner) == noone) and (instance_place(x, y+TILE_SIZE, objMud) == noone) and (instance_place(x, y+TILE_SIZE, objParentMudInsideCorner) == noone)  
   {
        instance_change(objMudCornerBR, true) 
   }   
   if (instance_place(x-TILE_SIZE, y, objMud) == noone) and (instance_place(x-TILE_SIZE, y, objParentMudInsideCorner) == noone) and (instance_place(x, y+TILE_SIZE, objMud) == noone) and (instance_place(x, y+TILE_SIZE, objParentMudInsideCorner) == noone)  
   {
        instance_change(objMudCornerBL, true) 
   }
}
// turn outside corners into points where appropriate
with objMudCornerTR
{
    if instance_place(x-TILE_SIZE, y, objMud) == noone and instance_place(x-TILE_SIZE, y, objParentMudInsideCorner) == noone and instance_place(x-TILE_SIZE, y, objParentMudOutsideCorner) == noone 
    {
        instance_change(objMudPointUp, true) 
    }
}