extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if randf_range(0,1) > 0.25:
		$Water_Cooler.queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
