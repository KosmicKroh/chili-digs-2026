extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HealthBar.value = clamp(Globals.playerHealth,0,100.0)
	$StaminaBar.value = clamp(Globals.rollCooldown,0,2.0)
	$EnemyCounterBar.max_value = Globals.enemyGoal
	$EnemyCounterBar.value = clamp(Globals.killCount,0,Globals.enemyGoal)
