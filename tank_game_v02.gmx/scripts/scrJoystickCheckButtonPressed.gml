// takes arguments joystick id (argument0) and button id (argument1)
var joystick_id, button_id ;
joystick_id = argument0
button_id = argument1
button_pressed[button_id] = joystick_check_button(joystick_id, button_id)
if button_previous_pressed[button_id] // previously in pressed state
{
    button_previous_pressed[button_id]= button_pressed[button_id]
    return (false)  
}
else // previously not in pressed state
{
    button_previous_pressed[button_id] = button_pressed[button_id]
    return (button_pressed[button_id])
}