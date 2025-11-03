extends Node

#Variáveis para armazenar velocidade do mundo do jogo
var world_speed := 50.0
var max_world_speed := 400.0
var world_acceleration := 2.0

#Variáveis para armazenar velocidade dos objetos
var obj_speed := 70.0
var max_obj_speed := 500.0
var obj_acceleration := 2.0

var high_score = 0

func _ready():
	load_high_score()

func load_high_score():
	#verifica se o arquivo de save existe
	if FileAccess.file_exists("user://savegame.dat"):
		#abre o arquivo em modo leitura
		var file = FileAccess.open("user://savegame.dat", FileAccess.READ)
		high_score = file.get_var() #lê o valor salvo e armazena em high score
		file.close() #fecha o arquivo
	else:
		high_score = 0 #se não existir, começamos com recorde zerado
		
	
func save_high_score():
	#abre ou cria um arquivo de salvamento no modo escrita
	var file = FileAccess.open("user://savegame.dat", FileAccess.WRITE)
	file.store_var(high_score) #salva o valor atual no arquivo
	file.close() #fechamos o arquivo
	
func reset_values():
	world_speed = 50.0
	obj_speed = 70.0
	
