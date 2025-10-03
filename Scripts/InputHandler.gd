extends Node
class_name InputHandler

signal move_requested(direction: Vector2)
signal shoot_pressed
signal roll_requested

func _process(_delta):
	var input_dir = Input.get_vector("MoveLeft", "MoveRight", "MoveUp", "MoveDown")
	move_requested.emit(input_dir)
	
	if Input.is_action_pressed("shoot"):
		shoot_pressed.emit()
	if Input.is_action_just_pressed("BarrelRoll"):
		roll_requested.emit()