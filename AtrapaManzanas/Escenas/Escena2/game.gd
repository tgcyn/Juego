extends Node

@onready var jugador = $Jugador
var scoreJugador := 0
signal winner
signal looser

func _ready():
	jugador.connect("scoreUp", subirScore) # conecto para q cnd se emita esa señal se ejecute el metodo de este script
	jugador.connect("playerDied", morir)
	
func subirScore():
	scoreJugador += 1
	$ScoreLabel.text = str(scoreJugador)
	pass

func morir():
	$DeathScreen/PuntuacionFinal/Label2.text = str(scoreJugador)
	$DeathScreen.show()
	get_tree().paused = true

func _on_timer_timeout():
	$DeathScreen/PuntuacionFinal/Label2.text = str(scoreJugador)
	$DeathScreen.show()
	get_tree().paused = true

func _on_repetir_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Escenas/Escena2/game.tscn")

func _on_continuar_pressed():
	get_tree().paused = false
	if scoreJugador >= 10:
		get_tree().change_scene_to_file("res://Escenas/Escena_Final/final.tscn")
	else:
		get_tree().change_scene_to_file("res://Escenas/Escena_Final/final_perder.tscn")
