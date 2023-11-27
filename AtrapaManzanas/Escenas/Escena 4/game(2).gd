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
	get_tree().paused = true
