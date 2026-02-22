extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Stages/Stage1.generate()
	$Particles.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Globals.stage == -1:
		AudioServer.get_bus_effect(1,0).cutoff_hz = 1000
		$Settings.visible = $SettingsZone.has_overlapping_bodies()
		$MainCam.position = Vector2(640,360)
		if Globals.playerPosition.x < -50:
			$MainCam.position = Vector2(-640,360)
		elif Globals.playerPosition.y < -50:
			$Player.position = Vector2(450,-1200)
			Globals.stage = 0
		elif Globals.playerPosition.y > 750:
			get_tree().quit()
	else:
		if Input.is_action_just_pressed("ui_cancel"):
			$Settings.visible = !$Settings.visible
		if Globals.stage == 0:
			AudioServer.get_bus_effect(1,0).cutoff_hz = 2500
		else:
			AudioServer.get_bus_effect(1,0).cutoff_hz = 20000
		var camOffset = get_viewport().get_mouse_position() - Vector2(640,360)
		$MainCam.position = Globals.playerPosition + camOffset/4.0 + Vector2.from_angle(randf_range(0,10))*Globals.shakeEffect*30.0*Globals.screenShake/70.0
		$MainCam.zoom = Vector2.ONE + Vector2(0.1,0.1)*Globals.shakeEffect*Globals.screenShake/70.0


func _on_first_elevator_body_entered(body):
	if "player" in body and body.has_stapler:
		$HUD.visible = true
		Globals.enemyGoal = $Stages/Stage1.enemyCount
		Globals.killCount = 0
		$Player.position = $Stages/Stage1.position + Vector2(150,0)
		Globals.stage = 1
		$ElevatorSound.play()
		$Stages/Stage2.generate()


func _on_stage_1_next_stage():
	Globals.enemyGoal = $Stages/Stage2.enemyCount
	Globals.killCount = 0
	$Player.position = $Stages/Stage2.position + Vector2(150,0)
	Globals.stage = 2
	$ElevatorSound.play()
	$Stages/Stage3.generate()


func _on_stage_2_next_stage():
	Globals.enemyGoal = $Stages/Stage3.enemyCount
	Globals.killCount = 0
	$Player.position = $Stages/Stage3.position + Vector2(150,0)
	Globals.stage = 3
	$ElevatorSound.play()
	$Stages/Stage4.generate()
	$Stages/Stage1.queue_free()


func _on_stage_3_next_stage():
	Globals.enemyGoal = $Stages/Stage4.enemyCount
	Globals.killCount = 0
	$Player.position = $Stages/Stage4.position + Vector2(150,0)
	Globals.stage = 4
	$ElevatorSound.play()
	$Stages/Stage5.generate()
	$Stages/Stage2.queue_free()


func _on_stage_4_next_stage():
	Globals.enemyGoal = $Stages/Stage5.enemyCount
	Globals.killCount = 0
	$Player.position = $Stages/Stage5.position + Vector2(150,0)
	Globals.stage = 5
	$ElevatorSound.play()
	$Particles.visible = true
	$Stages/Stage3.queue_free()


func _on_settings_zone_body_exited(_body):
	Globals.save_data()


func _on_settings_zone_body_entered(_body):
	$Settings/MusicVolume.value = Globals.musicVolume
	$Settings/SFXVolume.value = Globals.sfxVolume
