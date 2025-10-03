extends CharacterBody3D

@export var input_handler : Node3D
@export var movement : Node3D
@export var weapon : Node3D
@export var health : Node3D

func _ready():
	add_to_group("player")
	collision_layer = 1
	
	input_handler.move_requested.connect(_on_move_requested)
	input_handler.shoot_pressed.connect(weapon.try_shoot)
	input_handler.roll_requested.connect(movement.start_roll)
	health.died.connect(_on_player_died)

func _on_move_requested(input_dir: Vector2):
	movement.update_movement(get_physics_process_delta_time(), input_dir)

func take_damage(amount: int):
	health.take_damage(amount)

func _on_player_died():
	pass
