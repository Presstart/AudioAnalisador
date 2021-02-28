extends HSlider


# Declare member variables here. Examples:
var volume = -6
var effect
var idx 
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.value = 0
	idx = AudioServer.get_bus_index("Record")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_VSlider_VG_value_changed(value):
		
	#O volume como é em DB precisa ser passado para linear pela equação seguinte:
	volume = value
	#teste de mudamça de volume pelo slider
	#AudioServer.set_bus_volume_db(1, value)
	
	pass # Replace with function body.
