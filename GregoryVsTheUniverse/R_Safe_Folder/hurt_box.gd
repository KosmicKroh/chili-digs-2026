extends Area2D

@export var Max_Health: int
var Health: int

func _ready() -> void:
	Health = Max_Health

func _on_area_entered(area: Area2D) -> void:
	if "damage" in area:
		Health -= area.damage
		if Health < 0:
			get_parent().queue_free()# death function is needed
