# con el timer determino cnt tiempo tardan en aparecer cada una
extends Node2D

var ColeccionableEscena = preload("res://Escenas/Escena2/coleccionable.tscn")

# generar aleatoriamente cnd caen
func _ready():
	$Timer.stop()
	$Timer.wait_time = randf_range(2, 4) # genera un numero random de espera entre 2 y 4 segs
	$Timer.start()
	
func _on_timer_timeout():
	var coleccionable = ColeccionableEscena.instantiate() # esto quiere decir q es una copia de ColeccionableEscena
	add_child(coleccionable) # esto quiere decir q coleccionable es hijo de spawner
