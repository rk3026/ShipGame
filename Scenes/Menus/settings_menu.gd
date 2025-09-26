extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_back_to_title_button_pressed() -> void:
	pass
	#AudioManager.PlayBackSound()
	#this.GetParent<SceneSwitcher>().PopScene()

func _on_tab_container_tab_selected(tabIndex: int) -> void:
	pass
	#AudioManager.PlayClickSound()
