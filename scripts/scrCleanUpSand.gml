show_debug_message("Filling in sand inside corners")
// fill in sand inside corners
with objSand
{
    if not instance_place(x, y, objWaterShallow)
    {
        if (instance_place(x+TILE_SIZE, y+TILE_SIZE, objSand) > 0) and (instance_place(x+TILE_SIZE, y, objSand) == noone) then
        {
            instance_create(x+TILE_SIZE, y, objSandTR) 
        }
        if (instance_place(x-TILE_SIZE, y+TILE_SIZE, objSand) > 0) and (instance_place(x-TILE_SIZE, y, objSand) == noone) then
        {
            instance_create(x-TILE_SIZE, y, objSandTL) 
        }
        if (instance_place(x+TILE_SIZE, y-TILE_SIZE, objSand) > 0) and (instance_place(x+TILE_SIZE, y, objSand) == noone) then
        {
            instance_create(x+TILE_SIZE, y, objSandBR) 
        }
        if (instance_place(x-TILE_SIZE, y-TILE_SIZE, objSand) > 0) and (instance_place(x-TILE_SIZE, y, objSand) == noone) then
        {
            instance_create(x-TILE_SIZE, y, objSandBL) ;
        }
    }
}

show_debug_message("Rounding out sand outside corners")
// round off sand outside corners
with objSand
{
   if (instance_place(x+TILE_SIZE, y, objSand) == noone) and (instance_place(x, y-TILE_SIZE, objSand) == noone)  
   {
        instance_change(objSandCornerTR, true) 
   }
   if (instance_place(x-TILE_SIZE, y, objSand) == noone) and (instance_place(x, y-TILE_SIZE, objSand) == noone)  
   {
        instance_change(objSandCornerTL, true) 
   }
   if (instance_place(x+TILE_SIZE, y, objSand) == noone) and (instance_place(x, y+TILE_SIZE, objSand) == noone)  
   {
        instance_change(objSandCornerBR, true) 
   }
   if (instance_place(x-TILE_SIZE, y, objSand) == noone) and (instance_place(x, y+TILE_SIZE, objSand) == noone)  
   {
        instance_change(objSandCornerBL, true) 
   }
}