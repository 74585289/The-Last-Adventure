extends KinematicBody2D

const MAX_SPEED : float = 100.0
const GRAVITY : float = 25.0

var motion := Vector2()

func _ready():
	$AnimatedSprite.scale.x = -1
	motion.x = MAX_SPEED

func _physics_process(_delta):
	motion.y += GRAVITY


	motion = move_and_slide(motion)
	






	
	

