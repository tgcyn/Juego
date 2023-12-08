extends Node

@onready var jugador = $jugador

func _ready():
	jugador.connect("win", ganar)
	jugador.connect("lost", perder)
	jugador.connect("winner", ganar)
	jugador.connect("losser", perder)

func ganar():
	$ganar.show()

func perder():
	$perder.show()

