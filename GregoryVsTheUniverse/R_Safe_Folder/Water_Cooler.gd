extends Area2D

# Uses a layer 5 Area2D and an interactions scene to detect event execution
# This goes on a Area2D
# The Interactions scene goes on what you want to detect this

func execute_event(caller):
	caller.get_child("HurtBox").heal(10)
	queue_free()
