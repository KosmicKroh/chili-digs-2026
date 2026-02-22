extends Area2D

# Talks to HitBox and handels Parent death call

@export var Max_Health: int
var Health: int

func _ready() -> void:
	Health = Max_Health

func heal(notdamage: int):
	Health += notdamage
	if Health > Max_Health:
		Health = Max_Health

func _on_area_entered(area: Area2D) -> void:
	if "damage" in area:
		Health -= area.damage
		$HurtSound.pitch_scale = randf_range(0.8,1.2)
		$HurtSound.play()
		if "player" in area.get_parent():
			Globals.playerHealth = Health
		if Health < 0:
			if "player" not in area.get_parent():
				Globals.killCount += 1
				Globals.shakeEffect = 3.0
				var explosion = load("res://R_Safe_Folder/Explosion.tscn").instantiate()
				explosion.position = area.get_parent().position
				area.get_parent().get_parent().add_child(explosion)
			get_parent().queue_free()# death function is needed
