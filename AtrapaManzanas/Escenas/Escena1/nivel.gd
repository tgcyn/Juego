extends Control

func _on_facil_pressed():
	get_tree().change_scene_to_file("res://Escenas/buho_facil/node.tscn")


func _on_dificil_pressed():
	get_tree().change_scene_to_file("res://Escenas/buho_dificil/buho_dificil.tscn")
