extends CanvasLayer

enum PERS {Bruja, Buho, Buho_2} #le asigna un valor a cada uno de los personajes para poder trabajar con ellos como numeros

# imagenes q aparecen en el cuadro al hablar
const IMA : Dictionary = {
	"Bruja": preload("res://Assets/Personajes/cara_bruja.png"),
	"Buho": preload("res://Assets/Personajes/buho.png")
}

# dialogo de la bruja y el zorro
const TEX_Bruja : Array = [
	'Zorro: Uh, ¿Dónde estoy?
	Bruja: Por fin te veo, pense que no llegarías nunca',
	'Zorro: ¿Quién eres? ¿Qué quieres?
	Bruja: Me he llevado algo que te pertenece',
	'Bruja: Para recuperarlo deberás susperar una serie de pruebas...'
]

# diálogo del buho con el zorro
const TEX_Buho : Array = [
	'Buho: Buenos días joven
	Zorro: ¿Quién habla?',
	'Buho: Estoy aquí en el árbol
	Zorro: Vale, pero, ¿dónde estoy?',
	'Buho: Estas en uno de los patios del castillo de la bruja
	Buho: Vengo a explicarte en que consiste tu misión',
	'Buho: Tendrás que recolectar todas las manzanas que puedas',
	'Buho: Después irás con la bruja y las intercambiarás por tus cosas',
	'Mucha suerte'
]

const TEX_Buho_2 : Array = [
	'Buho: Buenos días joven
	Zorro: ¿Qué ha pasado? ¿Por qué soy un ratón?',
	'Buho: Oh, es cosa de la bruja, para que no sea tan fácil recuperar tus cosas',
	'Zorro: ¿Eh? ¿Quién habla?
	Buho: Estoy en el árbol',
	'Buho: Estas en uno de los patios del castillo de la bruja
	Buho: Vengo a explicarte en que consiste tu misión',
	'Buho: Tendrás que recolectar todas las manzanas que puedas',
	'Buho: Después irás con la bruja y las intercambiarás por tus cosas',
	'Mucha suerte, la necesitarás'
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

# q pasa al entrar en contacto con el birrete de la escena facil
func _on_buho_body_entered(body):
	if body.is_in_group("Jugador"):
		poner_texto(TEX_Buho[chats], PERS.Buho, IMA['Buho'])
		chats += 1

# q pasa al entrar en ontacto con el birrete de la escena dificil
func _on_buho_2_body_entered(body):
	if body.is_in_group("Jugador2"):
		poner_texto(TEX_Buho_2[chats], PERS.Buho_2, IMA['Buho'])
		chats += 1

# q sigan pasando de texto y q pasa cnd no quedan más
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
		
		PERS.Buho:
			if chats < TEX_Buho.size():
				poner_texto(TEX_Buho[chats], PERS.Buho, IMA['Buho'])
				chats += 1
			else:
				chats -= TEX_Buho.size()
				hide()
				get_tree().paused = false
				get_tree().change_scene_to_file("res://Escenas/Escena2/game.tscn")
		
		PERS.Buho_2:
			if chats < TEX_Buho_2.size():
				poner_texto(TEX_Buho_2[chats], PERS.Buho_2, IMA['Buho'])
				chats += 1
			else:
				chats -= TEX_Buho_2.size()
				hide()
				get_tree().paused = false
				get_tree().change_scene_to_file("res://Escenas/Escena 4/game(2).tscn")


