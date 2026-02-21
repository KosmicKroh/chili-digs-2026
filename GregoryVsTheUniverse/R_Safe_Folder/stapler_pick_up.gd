extends Area2D

# Uses a layer 5 Area2D and an interactions scene to detect event execution
# This goes on a Area2D
# The Interactions scene goes on what you want to detect this

@export var weapon: PackedScene = preload("res://R_Safe_Folder/Gun.tscn")

func execute_event(caller):
	caller.add_child(weapon.instantiate())
	queue_free()
