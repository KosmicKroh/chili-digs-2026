extends Area2D

# Uses a layer 5 Area2D and an interactions scene to detect event execution
# This goes on a Area2D
# The Interactions scene goes on what you want to detect this

@export var weapon: PackedScene = preload("res://R_Safe_Folder/Gun.tscn")
@export var hard:bool = false

func _ready():
	if hard:
		$Sprite2D.visible = false
		$Sprite2D2.visible = true

func _process(_delta):
	scale = Vector2.ONE * (2.0+sin(Time.get_ticks_msec()/250.0)*0.7)

func execute_event(caller):
	caller.add_child(weapon.instantiate())
	caller.has_stapler = true
	Globals.hardMode = hard
	print(Globals.hardMode)
	visible = false
	queue_free()
