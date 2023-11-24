extends CanvasLayer

enum PERS {Bruja, Zorro} #le asigna un valor a cada uno de los personajes para poder trabajar con ellos como numeros

# imagenes q aparecen en el cuadro al hablar
const IMA : Dictionary = {
	"Bruja": preload("res://Assets/Personajes/cara_bruja.png")
}

# dialogo de la bruja y el zorro
const TEX_Bruja : Array = [
	'Zorro: Uh, ¿Dónde estoy?
	Bruja: Por fin te veo, pense que no llegarías nunca',
	'Zorro: ¿Quién eres? ¿Qué quieres?
	Bruja: Me he llevado algo que te pertenece',
	'Bruja: Para recuperarlo deberás susperar una serie de pruebas...'
]

# comprueba q dialogo muestro de cada pesonaje
var chats : int = 0
# comprueba cual de los personajes esta hablando
var npc : int

#esto va a determinar como funciona nuestro dialogo en la escena
func poner_texto(Texto:String, NPC:int, Imag:Texture) -> void:
	show() # hago q aparezca, ya q inicialmente va a estar escondido
	get_tree().paused = true # pauso la escena 
	$Texto.text = Texto # le envio al texto de conversacion el texto q voy a indicar aqui
	npc = NPC
	$Imagen.texture = Imag # le envio la imagen a la de conversacion
	$AnimationPlayer.play("visualizar_texto") # digo q se empiece a ejecutar dicho animationPlayer
	
# q pasa al entrar en contacto con ese personaje
func _on_bruja_body_entered(body):
	if body.is_in_group("Jugador"):
		poner_texto(TEX_Bruja[chats], PERS.Bruja, IMA['Bruja'])
		chats += 1

func _on_boton_pressed() -> void:
	match npc:
		PERS.Bruja:
			if chats < TEX_Bruja.size():
				poner_texto(TEX_Bruja[chats], PERS.Bruja, IMA['Bruja'])
				chats += 1
			else:
				chats -= TEX_Bruja.size()
				hide()
				get_tree().paused = false
				get_tree().change_scene_to_file("res://Escenas/Escena1/nivel.tscn")
