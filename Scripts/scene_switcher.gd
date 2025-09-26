extends Node
class_name SceneSwitcher

var current_scene : Node

func _ready() -> void:
	push_scene("res://Scenes/Menus/main_menu.tscn")

	
func push_scene(scene : String) -> void:
	if current_scene:
		current_scene.queue_free()
	current_scene = load(scene).instantiate()
	add_child(current_scene)
