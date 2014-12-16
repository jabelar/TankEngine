nearest_health_id = instance_nearest(x,y, objItemHealth)
nearest_ammo_id = instance_nearest(x, y, objItemAmmo)

// figure out who the enemy is
enemy_id = -1
if current_player = PLAYER1 
{
    if instance_exists(objPlayer2)
    {
        enemy_id = objPlayer2.id
        enemy_flag_id = objFlagBlue.id
        home_id = objHomeBaseTeam1.id
    }
}
if current_player = PLAYER2
{
    if instance_exists(objPlayer1)
    {
        enemy_id = objPlayer1.id
        enemy_flag_id = objFlagRed.id
        home_id = objHomeBaseTeam2.id
    } 
}