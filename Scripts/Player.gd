extends CharacterBody2D

@export var gravity := 800.0
@export var jump_force := 350.0

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
	
	#3 Animações
	if not is_on_floor():
		$anim.play("jump")
	else:
		$anim.play("run")
	
	move_and_slide()
