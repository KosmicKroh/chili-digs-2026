extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_sfx_volume_value_changed(value):
	Globals.sfxVolume = value
	AudioServer.set_bus_volume_linear(2,Globals.sfxVolume/100.0)


func _on_music_volume_value_changed(value):
	Globals.musicVolume = value
	AudioServer.set_bus_volume_linear(1,Globals.musicVolume/100.0)
