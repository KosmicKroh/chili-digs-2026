extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Stages/Stage1.generate()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Globals.stage == -1:
		$MainCam.position = Vector2(640,360)
		if Globals.playerPosition.y < -50:
			$Player.position = Vector2(450,-1200)
			Globals.stage = 0
	else:
		var camOffset = get_viewport().get_mouse_position() - Vector2(640,360)
		$MainCam.position = Globals.playerPosition + camOffset/4.0 + Vector2.from_angle(randf_range(0,10))*Globals.shakeEffect*30.0
		$MainCam.zoom = Vector2.ONE + Vector2(0.1,0.1)*Globals.shakeEffect


func _on_first_elevator_body_entered(body):
	if "player" in body:
		Globals.enemyGoal = $Stages/Stage1.enemyCount
		Globals.killCount = 0
		$Player.position = $Stages/Stage1.position + Vector2(150,0)
		$Stages/Stage2.generate()


func _on_stage_1_next_stage():
	Globals.enemyGoal = $Stages/Stage2.enemyCount
	Globals.killCount = 0
	$Player.position = $Stages/Stage2.position + Vector2(150,0)
	$Stages/Stage3.generate()
