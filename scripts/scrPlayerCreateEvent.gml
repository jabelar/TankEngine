body_sprite = sprTankBody1
has_main_gun = true

input_forward = vk_up
input_right = vk_right
input_left = vk_left
input_backward = vk_down
input_fire1 = vk_control
input_fire2 = vk_alt
input_fire3 = vk_space
input_change_spawn = ord('S')
input_flag = ord('F')

my_speed = 4
my_turn_speed = 5
global.ammo_main_gun[current_player] = 50
my_score = 0
my_health = 100
state = NORMAL

// offsets to ensure weapons launch from correct part
offset_angle_main_gun = 0
offset_distance_main_gun = 32

// initialize joystick button press variables
button_previous_pressed[5] = false
button_previous_pressed[6] = false
button_previous_pressed[7] = false

// initialize flag states
have_enemy_flag = false
have_own_flag = false

// get AI alarm going if computer player type
if player_type = COMPUTER
{
    alarm[1] = room_speed
}