// show_debug_message("scrProcessInput starting")
scrInputClear()

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
// show_debug_message("scrProcessInput finished")