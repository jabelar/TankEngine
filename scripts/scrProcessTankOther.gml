// pick up or drop own flag
if key_flag
{
    if have_own_flag
    {
        audio_play_sound(sndFlag, 1, false)
        own_flag_id.carrier = noone
        own_flag_id.state = FLAG_ABANDONED
        have_own_flag = false
    }
    // pick up flag if touching
    else if instance_place(x, y, own_flag_id) > 0
    {
        audio_play_sound(sndFlag, 1, false)
        own_flag_id.carrier = id
        own_flag_id.state = FLAG_RETURNING
        have_own_flag = true
    }
}
        