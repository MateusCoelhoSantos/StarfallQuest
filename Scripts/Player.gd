extends CharacterBody2D

@export var gravity := 800.0
@export var jump_force := 370.0

@onready var animated_sprite_2d = $anim

func _physics_process(delta):
	
	# 1 Gravidade
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0
		
	# 2 Pulo
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force
		
	if Input.is_action_just_pressed("down"):
		velocity.y = +175
		
	
	#3 Animações
	if not is_on_floor():
		$anim.play("jump")
		if is_on_floor():
			$anim.play("slide")
	else:
		$anim.play("run")
	
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Dangerous"):
		var main = get_tree().get_current_scene()
		main.on_player_died()
		
	elif area.is_in_group("Collectible"):
		area.queue_free()
