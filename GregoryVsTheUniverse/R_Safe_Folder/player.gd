extends CharacterBody2D

@export var player: bool = true
@export var speed = 300.0
var has_stapler = false

func _physics_process(_delta: float) -> void:
	Globals.playerPosition = position
	Globals.playerHealth = $HurtBox.Health
	move_and_slide()
	
func roll():
	Globals.rollCooldown = 0.5
	$AnimatedSprite2D.play("rolling")
	await get_tree().create_timer(0.33).timeout
	$AnimatedSprite2D.play("default")
	$Whoosh.pitch_scale = randf_range(0.8,1.2)
	$Whoosh.play()
