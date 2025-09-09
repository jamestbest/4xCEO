extends Control


func _on_button_pressed() -> void:
	Global.game_controller.remove_gui_scene() 
	Global.game_controller.change_2d_scene("res://Scenes/Maps/Map.tscn")
