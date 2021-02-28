extends ColorRect

const VU_COUNT = 16
const FREQ_MAX = 15050.0

const WIDTH = 200
const HEIGHT = 100

const MIN_DB = 60

var spectrum

func _draw():
	#warning-ignore:integer_division
	
	
	var w = 10
	var prev_hz = 0
	for i in range(1, VU_COUNT+1):	
		var hz = i * FREQ_MAX / VU_COUNT;
		var magnitude: float = spectrum.get_magnitude_for_frequency_range(prev_hz, hz).length()
		#print(magnitude)
		var energy = clamp((MIN_DB + linear2db(magnitude)) / MIN_DB, 0, 1)
		print(energy)
		var height = (energy * HEIGHT) + HEIGHT/2.0
		
		#selecao de cada perninha dos 16 VUS - 
		#A frequencia em HZ seleciona em que erna estara
		#Agora estou arrumando para aparecer mais vermelho quanto mais saturada a 
		#intesidade daquele tom de frequencia
		#Como é RGB
		#Mais R e menos das outars quando mais saturado
		#Quando mais baixo mais verde ou azul indo em espectro até o RED
		
		if(hz<1):
			draw_rect(Rect2(0, 150, w, -height), Color(energy * 100, 100, energy * 500))
		if(hz>500 && hz<=1000):
			draw_rect(Rect2(20, 150, w, -height), Color(energy * 100, 100, energy * 1300))
		if(hz>1000 && hz<=2000):
			draw_rect(Rect2(40, 150, w, -height), Color(magnitude * 100, 100, magnitude * 500))
		if(hz>2000 && hz<=3000):
			draw_rect(Rect2(60, 150, w, -height), Color(magnitude * 100, 100, magnitude * 500))
		if(hz>3000 && hz<=4000):
			draw_rect(Rect2(80, 150, w, -height), Color(magnitude * 100, 100, magnitude * 500))
		if(hz>4000 && hz<=5000):
			draw_rect(Rect2(100, 150, w, -height), Color(magnitude * 100, 100, magnitude * 500))
		if(hz>5000 && hz<=6000):
			draw_rect(Rect2(120, 150, w, -height), Color(magnitude * 100, 100, magnitude * 500))
		if(hz>6000 && hz<=7000):
			draw_rect(Rect2(140, 150, w, -height), Color(magnitude * 100, 100, magnitude * 500))
		if(hz>7000 && hz<=8000):
			draw_rect(Rect2(160, 150, w, -height), Color(magnitude * 100, 100, magnitude * 500))
		if(hz>8000 && hz<=9000):
			draw_rect(Rect2(180, 150, w, -height), Color(magnitude * 100, 100, magnitude * 500))
		if(hz>9000 && hz<=10000):
			draw_rect(Rect2(200, 150, w, -height), Color(magnitude * 100, 100, magnitude * 500))
		if(hz>10000 && hz<=11000):
			draw_rect(Rect2(220, 150, w, -height), Color(magnitude * 100, 100, magnitude * 500))
		if(hz>11000 && hz<=12000):
			draw_rect(Rect2(240, 150, w, -height), Color(magnitude * 100, 100, magnitude * 500))
		if(hz>12000 && hz<=13000):
			draw_rect(Rect2(260, 150, w, -height), Color(magnitude * 100, 100, magnitude * 500))
		if(hz>13000 && hz<=14000):
			draw_rect(Rect2(280, 150, w, -height), Color(magnitude * 100, 100, magnitude * 500))
		if(hz>14000 && hz<=15000):
			draw_rect(Rect2(300, 150, w, -height), Color(magnitude * 100, 100, magnitude * 500))
				
		var pos = Vector2(10,100)	
		var str_var = "Frequencia"
		var str_frq = "Taram"
		draw_char("Arial", pos, str_freq, Color(1,1,1,1))
		prev_hz = hz
		
func _salvar():
	#salva o espectro num vetor
	pass

func _ler():
	#le vetor do salvo
	pass

func _process(_delta):
	update()


func _ready():
	spectrum = AudioServer.get_bus_effect_instance(0,0)
