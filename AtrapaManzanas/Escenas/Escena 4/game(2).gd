extends Node

@onready var jugador = $CharacterBody2D
var scoreJugador := 0

func _ready():
	jugador.connect("scoreUp", subirScore)
	jugador.connect("playerDied", morir)

func subirScore():
	scoreJugador += 1
	$scoreLabel.text = str(scoreJugador)
	pass

func morir():
	$Muerte/HBoxContainer/Label2.text = str(scoreJugador)
	$Muerte.show()

func _on_timer_timeout():
	$Muerte/HBoxContainer/Label2.text = str(scoreJugador)
	$Muerte.show()

func _on_repetir_pressed():
	get_tree().change_scene_to_file("res://Escenas/Escena 4/game(2).tscn")

func _on_continuar_pressed():
	if scoreJugador >= 10: # en caso de que consiga 10 o mas manzanas, gana
		get_tree().change_scene_to_file("res://Escenas/Escena_Final/final.tscn")
	else: # en caso de que consiga menos, pierde
		get_tree().change_scene_to_file("res://Escenas/Escena_Final/final_perder.tscn")
	
