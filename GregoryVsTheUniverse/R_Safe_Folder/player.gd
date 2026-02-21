extends CharacterBody2D

@export var player: bool = true
@export var speed = 300.0

func _physics_process(_delta: float) -> void:
	Globals.playerPosition = position
	move_and_slide()
	
