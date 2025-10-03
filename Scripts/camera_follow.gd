extends Camera3D

@export var follow_target: NodePath
@export var follow_speed: float = 5.0
@export var follow_distance: Vector3 = Vector3(0, 2, -5)

var target: Node3D

func _ready():
	if follow_target:
		target = get_node(follow_target)
	else:
		# Find player
		var players = get_tree().get_nodes_in_group("player")
		if players.size() > 0:
			target = players[0]

func _physics_process(delta: float) -> void:
	if target:
		var target_position = target.global_position + follow_distance
		global_position = global_position.lerp(target_position, follow_speed * delta)
		# Look at player
		look_at(target.global_position, Vector3.UP)