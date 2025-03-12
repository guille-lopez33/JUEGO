extends Control


func _on_button_pressed():
	get_tree().change_scene_to_file("res://escenas/fondos/bosque.tscn")


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://escenas/menu/opciones.tscn")


func _on_button_3_pressed():
	get_tree().change_scene_to_file("res://escenas/menu/créditos.tscn")


func _on_button_4_pressed():
	get_tree().quit()
