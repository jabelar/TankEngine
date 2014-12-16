// intended to be called in the Create event of every object
// input types
globalvar TANK_KEYBOARD, TANK_JOYSTICK_PAIR, TANK_JOYSTICK_SING, TANK_JOYSTICK_DIR, TANK_TOUCH ;
TANK_KEYBOARD = 0
TANK_JOYSTICK_PAIR = 1 // use both sticks for tank and turret fixed in same direction
TANK_JOYSTICK_SING = 2 // left stick for tank movement with relative turning
TANK_JOYSTICK_DIR = 3 // left stick for tank movement in direction pointed to
TANK_TOUCH = 4
globalvar TURRET_KEYBOARD, TURRET_JOYSTICK_PAIR, TURRET_JOYSTICK_SING, TURRET_JOYSTICK_DIR, TURRET_TOUCH ;
TURRET_KEYBOARD = 0
TURRET_JOYSTICK_PAIR = 1 // use both sticks for tank and turret fixed in same direction
TURRET_JOYSTICK_SING = 2 // left stick for tank movement with relative turning
TURRET_JOYSTICK_DIR = 3 // left stick for tank movement in direction pointed to
TURRET_TOUCH = 4

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
globalvar TILE_SIZE, OBJ_DENSITY ;
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
globalvar ENEMY, ENEMY_FLAG, OWN_FLAG, AMMO, HEALTH, HOME;
ENEMY = 0
ENEMY_FLAG = 1
OWN_FLAG = 2
AMMO = 3
HEALTH = 4
HOME = 5
// base speeds
globalvar TANK_SPEED_BASE, TANK_TURN_SPEED_BASE, TANK_TURRET_SPEED_MULTIPLIER ;
globalvar BULLET_SPEED_BASE, BULLET_BASE_RANGE ;
TANK_SPEED_BASE = 4
TANK_TURN_SPEED_BASE = 2
TANK_TURRET_SPEED_MULTIPLIER = 2
BULLET_SPEED_BASE = 32
BULLET_RANGE_BASE = 0.50 // this is time (multiplier for room_speed

// base stats
globalvar HEALTH_BASE ;
HEALTH_BASE = 100