extends Node2D

var Items = preload("res://Escenas/Escena2/coleccionable.tscn")

func _ready():
	$Timer.stop()
	$Timer.wait_time = randf_range(2, 4) # genera un numero random de espera entre 2 y 4 segs
	$Timer.start()

func _on_timer_timeout():
	var coleccionable = Items.instantiate()
	add_child(coleccionable)
