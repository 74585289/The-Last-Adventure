extends KinematicBody2D

const ACCELERATION = 70
const MAX_SPEED = 300
const JUMP_H = -700
const UP = Vector2(0, -1)
const gravity = 40

onready var _animated_sprite = $AnimatedSprite

var motion = Vector2()


func _process(delta):
	motion.y += gravity
	var friction = false

	if Input.is_action_pressed("ui_right"):
		_animated_sprite.play("correr")
		$AnimatedSprite.flip_h = false
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
	elif Input.is_action_pressed("ui_down"):
		_animated_sprite.play("muere")
	elif Input.is_action_pressed("ui_left"):
		_animated_sprite.play("correr")
		$AnimatedSprite.flip_h = true
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
	elif Input.is_action_pressed("ui_accept"):
		_animated_sprite.play("muerto")
	elif Input.is_action_pressed("abajo"):
		_animated_sprite.play("muerte")
	else:
		_animated_sprite.play("stop")
		friction = true

	if is_on_floor():
 
		if Input.is_action_just_pressed("ui_accept"):
			motion.y = JUMP_H
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.5)
	else:
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.01)

	motion = move_and_slide(motion, UP)
