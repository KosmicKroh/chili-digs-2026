extends CharacterBody2D

@export var speed = 100

func _process(_delta: float) -> void:
	move_and_slide()
