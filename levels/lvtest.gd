extends Node
#TODO ADD DIRECTION IN WHICH THE DROPS ARE GOING
#shooting code 
#yes i know, it shouldnt be in the level
#it just wont work if the script is on the player lmao
#just add that script to each new level, no biggie
const scn_drop = preload("res://projectiles/waterdrop.tscn")
onready var pos_cannon = get_node("player/cannon/shootingSource")

func create_drop(pos_cannon,facing_direction):
	var water = scn_drop.instance()
	water.set_position(pos_cannon)
	add_child(water)
	pass

func _on_player_shot(pos,facing_direction):
	facing_direction = facing_direction
	create_drop(pos,facing_direction)
	pass