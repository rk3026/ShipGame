extends Area3D

@export var speed: float = 20.0
@export var damage: int = 1
@export var target_group: String
@export var lifetime: float = 5.0
var direction: Vector3 = Vector3.FORWARD
var timer: float = 0.0

func _ready():
	timer = lifetime
	collision_layer = 4
	if target_group == "enemy":
		collision_mask = 2  # Detect enemies
	elif target_group == "player":
		collision_mask = 1  # Detect player

func _physics_process(delta: float) -> void:
	global_position += direction * speed * delta
	timer -= delta
	if timer <= 0:
		queue_free()

func _on_body_entered(body: Node3D) -> void:
	print("Bullet hit: ", body.name)
	if body.is_in_group(target_group):
		if body.has_method("take_damage"):
			body.take_damage(damage)
		queue_free()
	else:
		queue_free()