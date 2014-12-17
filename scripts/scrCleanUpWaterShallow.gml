show_debug_message("Filling in sand inside corners")
// fill in sand inside corners
with objWaterShallow
{
    //if not instance_place(x, y, objParentObstacle)
    {
        if (instance_place(x+TILE_SIZE, y+TILE_SIZE, objWaterShallow) > 0) and (instance_place(x+TILE_SIZE, y, objWaterShallow) == noone) then
        {
            instance_create(x+TILE_SIZE, y, objSand) 
            instance_create(x+TILE_SIZE, y, objWaterShallowTR) 
        }
        if (instance_place(x-TILE_SIZE, y+TILE_SIZE, objWaterShallow) > 0) and (instance_place(x-TILE_SIZE, y, objWaterShallow) == noone) then
        {
            instance_create(x-TILE_SIZE, y, objSand) 
            instance_create(x-TILE_SIZE, y, objWaterShallowTL) 
        }
        if (instance_place(x+TILE_SIZE, y-TILE_SIZE, objWaterShallow) > 0) and (instance_place(x+TILE_SIZE, y, objWaterShallow) == noone) then
        {
            instance_create(x+TILE_SIZE, y, objSand) 
            instance_create(x+TILE_SIZE, y, objWaterShallowBR) 
        }
        if (instance_place(x-TILE_SIZE, y-TILE_SIZE, objWaterShallow) > 0) and (instance_place(x-TILE_SIZE, y, objWaterShallow) == noone) then
        {
            instance_create(x-TILE_SIZE, y, objSand) ;
            instance_create(x-TILE_SIZE, y, objWaterShallowBL) ;
        }
    }
}

show_debug_message("Rounding out sand outside corners")
// round off sand outside corners
//with objWaterShallow
//{
//   if (instance_place(x+TILE_SIZE, y, objWaterShallow) == noone) and (instance_place(x, y-TILE_SIZE, objWaterShallow) == noone)  
//   {
//        instance_change(objWaterShallowCornerTR, true) 
//   }
//   if (instance_place(x-TILE_SIZE, y, objWaterShallow) == noone) and (instance_place(x, y-TILE_SIZE, objWaterShallow) == noone)  
//   {
//        instance_change(objWaterShallowCornerTL, true) 
//   }
//   if (instance_place(x+TILE_SIZE, y, objWaterShallow) == noone) and (instance_place(x, y+TILE_SIZE, objWaterShallow) == noone)  
//   {
//        instance_change(objWaterShallowCornerBR, true) 
//   }
//   if (instance_place(x-TILE_SIZE, y, objWaterShallow) == noone) and (instance_place(x, y+TILE_SIZE, objWaterShallow) == noone)  
//   {
//        instance_change(objWaterShallowCornerBL, true) 
//   }
// }