extends Control

func _on_facil_pressed():
	get_tree().change_scene_to_file("res://Escenas/Escena2/game.tscn")


func _on_dificil_pressed():
	get_tree().quit()
