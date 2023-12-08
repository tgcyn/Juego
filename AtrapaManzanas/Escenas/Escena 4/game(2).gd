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
	print("pulse continuar")
