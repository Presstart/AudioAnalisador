extends Node

var espectro
var file_name
var file = File.new()


func save(file):	

	var save_dict = {
		"filename" : get_filename(),
		"parent" : get_parent().get_path(),
		"f0" : espectro[0], 
		"f1" : espectro[1],
		"f2" : espectro[2],
		"f3" : espectro[3],
		"f4" : espectro[4],
		"f5" : espectro[5],
		"f6" : espectro[6],
		"f7" : espectro[7],
		"f8" : espectro[8],
		"f9" : espectro[9],
		"f10" : espectro[10],
		"f11" : espectro[11],
		"f12" : espectro[12],
		"f13" : espectro[13],
		"f14" : espectro[14],
		"f15" : espectro[15],
	}
	return save_dict

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
