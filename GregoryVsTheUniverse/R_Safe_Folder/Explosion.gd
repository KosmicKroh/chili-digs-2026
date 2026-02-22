extends AnimatedSprite2D

func _ready() -> void:
	play("default")
	$Sound.pitch_scale = randf_range(0.8,1.2)
	$Sound.play()
	await get_tree().create_timer(1).timeout
	queue_free()
