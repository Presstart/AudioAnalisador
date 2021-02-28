extends HSlider


# Declare member variables here. Examples:
var EQ21 = 0
var espectro
var idx
var idy
var valor_db 
var con

# Called when the node enters the scene tree for the first time.
func _ready():
	get_viewport().audio_listener_enable_2d = true
	idx = AudioServer.get_bus_index("Record")
	espectro = AudioServer.get_bus_effect_instance(idx,1)
	pass

func _on_VSlider_EQG_value_changed(value):
	valor_db = value
	
