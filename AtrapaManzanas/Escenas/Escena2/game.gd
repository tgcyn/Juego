extends Node

@onready var jugador = $Jugador
var scoreJugador := 0

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
	
