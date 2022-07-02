extends Node

enum { 
	# Common item states
	ACTIVE, INACTIVE
	
	# Carrot
	GROUND
	
	# Common dynamic object states
	IDLE, RUN, HURT, FALL, JUMP, 
	
	# Very uncommon (or player exclusive)
	CLIMB, ATTACK, ATTACK2, WALLSLIDE,
	
	# Player Updates
	DASH, BOOSTJUMP, BOOSTFALL,
	
	# AI Ground NPC
	WALK,
	
	# AI Ground Enemy
	PATROL, ALERT,
	
	# AI Flying Enemy
	CHASE,
	
	# CINEMATIC
	STARTGAME, PRESENTATION, CINIDLE, CINFALL
}
