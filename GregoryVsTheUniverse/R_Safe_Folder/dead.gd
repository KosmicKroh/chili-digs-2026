extends Control

func _ready() -> void:
	Globals.enemyGoal = 10
	Globals.killCount = 0
	Globals.bulletDamage = 1.0
	Globals.rollCooldown = 0.0
	Globals.stage = -1
	Globals.playerHealth = 100.0
	Globals.musicVolume = 70.0
	Globals.sfxVolume = 70.0
	Globals.playerPosition = Vector2(0,0)
	Globals.shakeEffect = 0.0
	AudioServer.get_bus_effect(1,0).cutoff_hz = 20000

func restart_pressed() -> void:
	get_tree().change_scene_to_file("main.tscn")

func quit_pressed() -> void:
	get_tree().quit()
