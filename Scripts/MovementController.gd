extends Node
class_name MovementController

@export var strafe_speed: float = 8.0
@export var bank_speed: float = 2.0
@export var max_bank_angle: float = 1.0
@export var pitch_speed: float = 2.0
@export var max_pitch_angle: float = 0.5
@export var roll_duration: float = 1.0
@export var roll_speed: float = 10.0
@export var roll_strafe_multiplier: float = 1.5

var parent_body: CharacterBody3D
var current_bank: float = 0.0
var current_pitch: float = 0.0
var is_rolling: bool = false
var roll_timer: float = 0.0
var roll_progress: float = 0.0

func _ready():
	parent_body = get_parent() as CharacterBody3D

func update_movement(delta: float, input_dir: Vector2):
	if is_rolling:
		roll_timer -= delta
		roll_progress += delta / roll_duration
		if roll_timer <= 0:
			is_rolling = false
			roll_progress = 0.0
		else:
			var t = roll_progress
			var eased_speed = sin(t * PI) * roll_speed
			parent_body.rotate_object_local(Vector3.FORWARD, eased_speed * delta)

	var current_strafe_speed = strafe_speed * (roll_strafe_multiplier if is_rolling else 1.0)
	parent_body.velocity.x = -input_dir.x * current_strafe_speed
	parent_body.velocity.y = -input_dir.y * current_strafe_speed
	parent_body.velocity.z = 0.0

	if not is_rolling:
		var target_bank = input_dir.x * max_bank_angle
		current_bank = lerp(current_bank, target_bank, bank_speed * delta)
		parent_body.rotation.z = current_bank
		
		var target_pitch = input_dir.y * max_pitch_angle
		current_pitch = lerp(current_pitch, target_pitch, pitch_speed * delta)
		parent_body.rotation.x = current_pitch

	parent_body.move_and_slide()

func start_roll():
	if not is_rolling:
		is_rolling = true
		roll_timer = roll_duration
		roll_progress = 0.0
		current_bank = 0.0
		current_pitch = 0.0
		parent_body.rotation.z = 0.0
		parent_body.rotation.x = 0.0