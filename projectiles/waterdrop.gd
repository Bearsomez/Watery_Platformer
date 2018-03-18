extends RigidBody2D

export var speed = Vector2()

func _ready():
	var facing_direction = get_node("../player").facing_direction
	print(facing_direction)
	if facing_direction:
		set_linear_velocity(Vector2(speed.x,-speed.y))
	else:
		set_linear_velocity(Vector2(-speed.x,-speed.y))
	pass

func _process(delta):
	pass

