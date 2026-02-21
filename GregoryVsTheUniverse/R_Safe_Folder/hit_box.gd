extends Area2D
@export var damage: int

func _on_area_entered(area: Area2D) -> void:
	get_parent().queue_free()

func _on_body_entered(body: Node2D) -> void:
	get_parent().queue_free()
