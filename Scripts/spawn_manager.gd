extends Node2D

const COGUMELO = preload("res://Scenes/cogumelo.tscn")
const OBSTACULO = preload("res://Scenes/obstaculo.tscn")
const OLHO_VOADOR = preload("res://Scenes/olho_voador.tscn")
const ESTRELA = preload("res://Scenes/estrela.tscn")

const ground_y = 255
const obstaculo_y = 265
const flying_min_y = 255
const flying_max_y = 200
const estrela_y = 265

func spawn_object():
	var random_number = randi() % 100
	var packed: PackedScene
	
	if random_number < 20:
		packed = ESTRELA
	elif random_number < 36:
		packed = OLHO_VOADOR
	elif random_number < 81:
		packed = COGUMELO
	else :
		packed = OBSTACULO
		
	var inst = packed.instantiate()
	
	inst.position.x = get_viewport_rect().size.x + 20
	
	if packed == OLHO_VOADOR:
		inst.position.y = randf_range(flying_min_y, flying_max_y)
	elif packed == COGUMELO:
		inst.position.y = ground_y
	elif packed == OBSTACULO:
		inst.position.y = obstaculo_y
	else:
		inst.position.y = estrela_y
		
	get_parent().add_child(inst)

func _on_spawn_timer_timeout() -> void:
	spawn_object()
