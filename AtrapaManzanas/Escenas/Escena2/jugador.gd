extends CharacterBody2D

var speed := 150
signal scoreUp #creo una señal para poder hacer referencia a ella en otro script, como un id
signal playerDied
@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	# esto es para cuando realice un movimiento de izquierda a derecha
	var right_left = Input.get_axis("ui_left", "ui_right")
	# esto es para cuando quiera saltar
	var jump = Input.get_action_strength("ui_up")
	
	# asignar una direccion y velocidad a cada variable
	velocity.x = right_left * speed

	# comprobar q salte y hacer q la gravedad no sea acumulativa
	if jump != 0 and is_on_floor():
		velocity.y = 0
		velocity.y -= jump * 250

	# esto es para q caiga cnd salte y no se quede flotando por ahi
	if !is_on_floor():
		velocity.y += 15

	move_and_slide()
	
	if velocity.x != 0:
		animated_sprite_2d.play("run")
		animated_sprite_2d.flip_h = right_left<0
	else:
		animated_sprite_2d.play("idel ")

# acciones al tocar los items de pantalla
func subirScore():
	emit_signal("scoreUp") #cuando entre a este metodo emitira la señal especificada
	
func muerte():
	animated_sprite_2d.play("hurt")
	emit_signal("playerDied")
