show_debug_message("scrProcessInput starting")
// clear input
key_forward = false 
key_right = false 
key_left = false 
key_backward = false 
key_change_spawn = false 
key_flag = false 
key_weapon1_pressed = false
key_weapon2_pressed = false 
key_weapon3_pressed = false

if player_type = HUMAN
{
    scrProcessInputTank()
    scrProcessInputTurret()
    scrProcessInputTriggers()
}
else // computer player so process AI
{
    scrProcessAI()
}
show_debug_message("scrProcessInput finished")
