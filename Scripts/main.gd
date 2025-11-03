extends Node2D

func _physics_process(delta):
	if GameManager.obj_speed < GameManager.max_obj_speed:
		GameManager.obj_speed += GameManager.obj_acceleration * delta
		
	if GameManager.world_speed < GameManager.max_world_speed:
		GameManager.world_speed += GameManager.world_acceleration * delta
		
