extends KinematicBody2D
#defining variables
#movement variables
export var max_running_speed = 0
export var jumping_speed = 0
export var gravity = 0
export var acceleration = 0
var friction_enabled = false
#shooting variables
onready var barrel = get_node("cannon/shootingSource").get_position()
var pos = get_position()
var barrel_pos = 0
export(float, -1, 1) var friction = 0
var facing_direction = true
#defining signals
#shooting signals
signal shot(pos)

func _ready():
	pass

#basic movement definitions
var motion = Vector2()
const UP = Vector2(0, -1)

func _process(delta):
	
	motion.y += gravity
	friction_enabled = false
	
	if Input.is_action_pressed("ui_right"):
		#movement
		motion.x = min(motion.x+acceleration, max_running_speed)
		#animations
		$Sprite.flip_h = false
		$Sprite.play("walk")
	elif Input.is_action_pressed("ui_left"):
		#movement
		motion.x = max(motion.x-acceleration, -max_running_speed)
		#animations
		$Sprite.flip_h = true
		$Sprite.play("walk")
	else:
		#movement
		$Sprite.play("idle")
		friction_enabled = true
	
	if is_on_floor():
		#movement
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -jumping_speed
		if friction_enabled == true:
			motion.x = lerp(motion.x, 0, friction)
	else:
		if motion.y < 0:
			$Sprite.play("jump")
		else:
			$Sprite.play("fall")
		lerp(motion.x, 0, friction/4)
	
	#shooting code
	if Input.is_action_pressed("ui_right"):
		facing_direction = true
	if Input.is_action_pressed("ui_left"):
		facing_direction = false
	
	barrel_pos = barrel + self.get_position()
	if Input.is_action_just_pressed("shoot"):
		emit_signal("shot",barrel_pos,facing_direction)
		pass
	
	#always affect character with values
	motion = move_and_slide(motion, UP)
	pass