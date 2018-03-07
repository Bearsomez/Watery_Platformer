extends KinematicBody2D

export var running_speed = 0
export var jumping_speed = 0
export var gravity = 0

var motion = Vector2()
const UP = Vector2(0, -1)

#basic left/right movement

func _process(delta):
	motion.y += gravity
	
	if Input.is_action_pressed("ui_right"):
		motion.x = running_speed
	elif Input.is_action_pressed("ui_left"):
		motion.x = -running_speed
	else:
		motion.x = 0
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = jumping_speed
	
	#always affect character with values
	motion = move_and_slide(motion, UP)
	print(motion)
	pass