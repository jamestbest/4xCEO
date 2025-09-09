class_name GameController extends Node

@export var world_2d : Node2D #These vars are assigned in the scene inspector.
@export var gui : Control

var current_2d_scene 
var current_gui_scene

func _ready() -> void:
	Global.game_controller = self #Set game controller variable in global script to this.
	current_gui_scene = gui.get_child(0)
	
func change_gui_scene(new_scene : String, delete : bool = true, keep_running : bool = false) -> void:
	if current_gui_scene != null:
		if delete:
			current_gui_scene.queue_free() #Remove the scene node entirely.
		elif keep_running:
			current_gui_scene.visible = false #The scene node will be kept in memory and will still be running.
		else:
			gui.remove_child(current_gui_scene) #The scene node will be kept in memory, but it will not be left running.
	var new = load(new_scene).instantiate()
	gui.add_child(new)
	current_gui_scene = new

func remove_gui_scene() -> void:
	current_gui_scene.queue_free()
	current_gui_scene = null
	
func change_2d_scene(new_scene : String, delete : bool = true, keep_running : bool = false) -> void:
	if current_2d_scene != null:
		if delete:
			current_2d_scene.queue_free() #Remove the scene node entirely.
		elif keep_running:
			current_2d_scene.visible = false #The scene node will be kept in memory and will still be running.
		else:
			world_2d.remove_child(current_2d_scene) #The scene node will be kept in memory, but it will not be left running.
	var new = load(new_scene).instantiate()
	world_2d.add_child(new)
	current_2d_scene = new
