extends Area2D

var esManzana = false
var enemigo = preload("res://Assets/Objetos/spike.png")

func _ready():
	# generar aleatoriamente si manzana o spike
	if randf() > .7: # genera un numero random entre 0 y 1, dividir a la mitad para q haya la misma probabilidad de q haya manzanas o spikes
		esManzana = true
	
	if !esManzana:
		$Sprite.texture = enemigo

func _on_body_entered(body):
	if body.is_in_group("Jugador"):
		if esManzana:
			body.subirScore()
		else:
			body.muerte()
		queue_free() # dps de tocar uno de los item desaparece
	
	if body.is_in_group("Jugador2"):
		if esManzana:
			body.subirScore()
		else:
			body.muerte()
		queue_free()

func _process(delta):
	position.y += 1 #  velocidad con la q caen
	
