extends CharacterBody2D

const SPEED = 300.0

func _physics_process(_delta: float) -> void:
	Globals.playerPosition = position
	move_and_slide()
	
