extends Area2D

# Uses a layer 3 Area2D and an interactions scene to detect event execution
# This goes on a Area2D
# The Interactions scene goes on what you want to detect it

@export var weapon: PackedScene = preload("res://R_Safe_Folder/Gun.tscn")

func execute_event(caller):
	caller.add_child(weapon.instantiate())
