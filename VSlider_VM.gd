extends HSlider


# Declare member variables here. Examples:
var volume = 0 #em db pode ser negativo (-6 a 72) DEFAULT = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	self.value = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_VSlider_VM_value_changed(value):
	
	#O volume como é em DB precisa ser passado para linear pela equação seguinte:
	volume = log(value)
	#teste de mudamça de volume pelo slider
	AudioServer.set_bus_volume_db(0, value)
	
	pass # Replace with function body.
