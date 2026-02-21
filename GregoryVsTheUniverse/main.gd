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
		$MainCam.position = Globals.playerPosition


func _on_first_elevator_body_entered(body):
	if "player" in body:
		$Player.position = Vector2(150,-10000)
