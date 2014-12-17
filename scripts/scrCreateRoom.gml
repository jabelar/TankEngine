show_debug_message("scrCreateRoom starting")

scaling_factor = room_width * room_height / (12000 * 12000)
show_debug_message("room_width = "+string(room_width))
show_debug_message("room_height = "+string(room_height))

// randomize seed
randomize()

show_debug_message("Spawning players, homebase and flags")
// spawn players
home_base_id_1 = instance_create(TILE_SIZE*3, TILE_SIZE*3, objHomeBaseTeam1)
home_base_id_2 = instance_create(room_width-TILE_SIZE*3, room_height-TILE_SIZE*3, objHomeBaseTeam2)
instance_create(home_base_id_1.x+home_base_id_1.sprite_width/2, home_base_id_1.y+home_base_id_1.sprite_width/2, objFlagRed)
instance_create(home_base_id_1.x+home_base_id_1.sprite_width/2, home_base_id_1.y+home_base_id_1.sprite_width/2, objPlayer1)
instance_create(home_base_id_2.x+home_base_id_2.sprite_width/2, home_base_id_2.y+home_base_id_2.sprite_width/2, objFlagBlue)
instance_create(home_base_id_2.x+home_base_id_2.sprite_width/2, home_base_id_2.y+home_base_id_2.sprite_width/2, objPlayer2)

scrGenerateWater(6)

scrCleanUpWaterShallow()

scrCleanUpSand()

scrGenerateMud(6)

show_debug_message("Populating walls")
// populate walls
repeat 100*scaling_factor
{
    map_object_id = instance_create((random(room_width) div TILE_SIZE)*TILE_SIZE, (random(room_height) div TILE_SIZE)*TILE_SIZE, objObstacleWall1)
    with map_object_id
    {
        scrFindFreeSpace() ;
    }
}

show_debug_message("Populating items")
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

with (objPlayer2)
{
    mp_grid_add_instances(grid, objParentObstacle, false)
    path_found = mp_grid_path(grid, path, x, y, objPlayer1.x, objPlayer1.y, true)
    if path_found
    {
        path_start(path, 0, 0, false)
        prev_ai_target = ai_target
        xpathstart = x
        ypathstart = y
    }
    show_debug_message("Path found = "+string(path_found)+" and Path length ="+string(path_get_length(path)))
}

show_debug_message("scrCreateRoom finished")