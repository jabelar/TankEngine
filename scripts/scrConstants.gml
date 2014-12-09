// intended to be called in the Create event of every object
// input types
globalvar KEYBOARD, JOYSTICK ;
KEYBOARD = 0
JOYSTICK = 1 // tank and turret fixed in same direction
JOYSTICKSEP = 2 // tank and turret move independently
TOUCH = 3
// states
globalvar HUMAN, COMPUTER ;
HUMAN = 0
COMPUTER = 1
globalvar NORMAL, CRITICAL, DYING ;
NORMAL = 0
CRITICAL = 1
DYING = 2
// game types
globalvar VERSUS, CAPTURE_THE_FLAG ;
VERSUS = 0
CAPTURE_THE_FLAG = 1
global.game_type = CAPTURE_THE_FLAG
// players
globalvar PLAYER1, PLAYER2 ;
PLAYER1 = 0
PLAYER2 = 1
// teams
globalvar TEAM1, TEAM2, TEAM3, TEAM4 ;
TEAM1 = 0
TEAM2 = 1
TEAM3 = 2
TEAM4 = 3
// room settings
globalvar TILE_SIZE ;
TILE_SIZE = 128
OBJ_DENSITY = 30 // per room
// delays
globalvar RESPAWN_DELAY, MAIN_GUN_DELAY ;
RESPAWN_DELAY = 1 * room_speed // one second
MAIN_GUN_DELAY = 1 * room_speed
// flag states
globalvar FLAG_HOME, FLAG_CAPTURED, FLAG_ABANDONED, FLAG_RETURNING ;
FLAG_HOME = 0
FLAG_CAPTURED = 1
FLAG_ABANDONED = 2
FLAG_RETURNING = 3
// things the AI might target
globalvar ENEMY, ENEMY_FLAG, OWN_FLAG, AMMO, HEALTH ;
ENEMY = 0
ENEMY_FLAG = 1
OWN_FLAG = 2
AMMO = 3
HEALTH = 4
HOME = 5
