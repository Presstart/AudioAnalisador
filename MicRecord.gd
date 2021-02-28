#
# Script é uma adequação do script que há no repositório do GODOT no Git
#
extends Control

var nsp = AudioStreamPlayer.new() 
var efeito
var gravacao
var stream_aberto

const FILE_NAME = "user://espectro_data.json"

var espectro = {
	"E1": { "f": 0, "v": 0},
	"E2": { "f": 0, "v": 0},
	"E3": { "f": 0, "v": 0},
	"E4": { "f": 0, "v": 0},
	"E5": { "f": 0, "v": 0},
	"E6": { "f": 0, "v": 0},
	"E7": { "f": 0, "v": 0},
	"E8": { "f": 0, "v": 0},
	"E9": { "f": 0, "v": 0},
	"E10": { "f": 0, "v": 0},
	"E11": { "f": 0, "v": 0},
	"E12": { "f": 0, "v": 0},
	"E13": { "f": 0, "v": 0},
	"E14": { "f": 0, "v": 0},
	"E15": { "f": 0, "v": 0},
	"E16": { "f": 0, "v": 0}
}


func file_save():
	var file = File.new()
	file.open(FILE_NAME, File.WRITE)
	file.store_string(to_json(espectro))
	file.close()

func load():
	var file = File.new()
	if file.file_exists(FILE_NAME):
		file.open(FILE_NAME, File.READ)
		var data = parse_json(file.get_as_text())
		file.close()
		if typeof(data) == TYPE_DICTIONARY:
			espectro = data
		else:
			printerr("Corrupted data!")
	else:
		printerr("No saved data!")

func _ready():
	var idx = AudioServer.get_bus_index("Record")
	efeito = AudioServer.get_bus_effect(idx, 0)
	#effect.set_recording_active(false)

func _on_RecordButton_pressed():
	if efeito.is_recording_active():
		gravacao = efeito.get_recording()
		$PlayButton.disabled = false
		$SaveButton.disabled = false
		efeito.set_recording_active(false)
		$RecordButton.text = "Gravar"
		$Status.text = ""
	else:
		$PlayButton.disabled = true
		$SaveButton.disabled = true
		efeito.set_recording_active(true)
		$RecordButton.text = "Parar"
		$Status.text = "Gravando..."


func _on_PlayButton_pressed():
	print(gravacao)
	print(gravacao.format)
	print(gravacao.mix_rate)
	print(gravacao.stereo)
	var data = gravacao.get_data()
	print(data)
	print(data.size())
	$AudioStreamPlayer.stream = gravacao
	$AudioStreamPlayer.play()


func _on_Play_Music_pressed():
	#Abrir o arquivo e tocar o mesmo
	get_node("DialogoCarregar").show()
	
	
	pass
	#if $AudioStreamPlayer2.playing:
	#	$AudioStreamPlayer2.stop()
	#	$PlayMusic.text = "Tocar Música"
	#else:
	#	$AudioStreamPlayer2.play()
	#	$PlayMusic.text = "Parar Música"


func _on_SaveButton_pressed():
	#criar arquivo com nome diferente para cada licao e mais adicao de id
	#exemplo: licao01_1.waw, licao01_2.wav, licao02_1.wav
	#isso será feito no script: MOSTRASPECTRO.gd
	get_node("DialogoSalvar").show()
	


#Aqui seleciona o arquivo para tocar
func _on_DialogoCarregar_file_selected(path):
	
	get_node("AudioStreamPlayer2").stream = loadfile(path)
	get_node("AudioStreamPlayer2").play()
	
	
func _on_DialogoSalvar_confirmed():
	print("Arquivo Salvo!")

#Funcao que analisa o som e formatacao do mesmo para validar
func loadfile(filepath):
	var file = File.new()
	file.open(filepath, File.READ)
	var bytes = file.get_buffer(file.get_len())

	# Se arquivo e wav
	if filepath.ends_with(".wav"):
		var newstream = AudioStreamSample.new()
		newstream.data = bytes
		return newstream 

	elif filepath.ends_with(".ogg"):
		var newstream = AudioStreamOGGVorbis.new()
		newstream.data = bytes
		return newstream

	else:
		print ("ERROO : FORMATO SE ARQUIVO ERRADO")
	file.close()
