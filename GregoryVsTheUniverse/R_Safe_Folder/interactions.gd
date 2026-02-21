extends Area2D

# If you have an interaction that you want to happen put a Area2D on layer 3 and define what
# you want to happen in a function named execute_event

func _on_area_entered(area: Area2D) -> void:
	#if Input.action_just_released("e"):
	area.execute_event()
