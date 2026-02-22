extends Area2D

# Uses a layer 5 Area2D and an interactions scene to detect event execution
# This goes on a Area2D
# The Interactions scene goes on what you want to detect this

var used = false

func _ready():
	modulate = Color(1.0,1.0,1.0,1.0)

func execute_event(caller):
	if not used:
		caller.find_child("HurtBox").heal(20)
		modulate = Color(0.4,0.4,0.4,1.0)
		$HealSound.play()
		used = true
