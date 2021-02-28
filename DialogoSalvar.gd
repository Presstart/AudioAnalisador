extends FileDialog

func _ready():
	set_filters(PoolStringArray(["*.wav ; sons WAV","*.ogg ; sons OGG"]))
