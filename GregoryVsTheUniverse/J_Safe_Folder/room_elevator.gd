extends Node2D

var not_glowing = load("res://Room-Elevator.png")
var totally_glowing = load("res://Room-Elevator-Glowing.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Globals.killCount >= Globals.enemyGoal:
		$Layout/Floor.texture = totally_glowing
	else:
		$Layout/Floor.texture = not_glowing
