extends CanvasLayer

var promoted = false

func promote():
	$PromoteSound.play()
	await get_tree().create_timer(0.92).timeout
	if $EnemyCounterBar/NamePlate.frame < 5:
		$EnemyCounterBar/NamePlate.frame += 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$HealthBar.value = clamp(Globals.playerHealth,0,100.0)
	$StaminaBar.value = clamp(0.5-Globals.rollCooldown,0,0.5)
	$EnemyCounterBar.max_value = Globals.enemyGoal
	$EnemyCounterBar.value = clamp(Globals.killCount,0,Globals.enemyGoal)
	if Globals.killCount >= Globals.enemyGoal:
		if not promoted:
			promoted = true
			promote()
	else:
		promoted = false
	if $PromoteSound.is_playing():
		var playPos = $PromoteSound.get_playback_position()
		$BarCover.visible = true
		if playPos < 0.92:
			$BarCover.modulate = Color(1.0,1.0,1.0,playPos*2.0)
			$EnemyCounterBar.scale = Vector2.ONE*(1.5+sqrt(playPos))
			$EnemyCounterBar.position = Vector2(520,40)+Vector2.from_angle(randf()*180)*playPos*8.0
		else:
			$BarCover.modulate = Color(1.0,1.0,1.0,2.0-playPos)
			$EnemyCounterBar.scale += Vector2.ONE*((max(0,2.0-playPos)+1.5-$EnemyCounterBar.scale.x)/20.0)
			$EnemyCounterBar.position = Vector2(520,40)+Vector2.from_angle(randf()*180)*max(0,2.0-playPos)*3.0
	else:
		$EnemyCounterBar.scale = Vector2(1.5,1.5)
		$EnemyCounterBar.position = Vector2(520,40)
		$BarCover.visible = false
	$BarCover.position = $EnemyCounterBar.position
	$BarCover.scale = $EnemyCounterBar.scale
