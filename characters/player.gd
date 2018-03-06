extends KinematicBody2D

var motion = Vector2()
export var player_speed_x = 100
export var player_speed_y = -400
const UP = Vector2(0, -1)

#basic left/right movement

func _process(delta):
	motion.y += 10
	
	if Input.is_action_pressed("ui_right"):
		motion.x = player_speed_x
	elif Input.is_action_pressed("ui_left"):
		motion.x = -player_speed_x
	else:
		motion.x = 0
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = player_speed_y
	
	#always affect character with values
	motion = move_and_slide(motion, UP)
	print(motion)
	pass