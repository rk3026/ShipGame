extends CharacterBody3D
@export var health: int = 10
@export var damage: int = 1
@export var shoot_interval: float = 2.0
@export var bullet_speed: float = 20.0

@export var shoot_timer: Timer

func _ready():
	add_to_group("enemy")
	collision_layer = 2  # Enemy layer
	shoot_timer.wait_time = shoot_interval
	shoot_timer.timeout.connect(_on_shoot_timer_timeout)
	shoot_timer.start()

func _physics_process(_delta: float) -> void:
	var players = get_tree().get_nodes_in_group("player")
	if players.size() > 0:
		var player = players[0]
		look_at(player.global_position, Vector3.UP, true)

func _on_shoot_timer_timeout():
	shoot()

func shoot():
	var players = get_tree().get_nodes_in_group("player")
	if players.size() > 0:
		var player = players[0]
		var direction = (player.global_position - global_position).normalized()
		var bullet_scene = preload("res://Scenes/bullet.tscn")
		var bullet = bullet_scene.instantiate()
		bullet.position = global_position + transform.basis.z * 2
		bullet.direction = direction
		bullet.speed = bullet_speed
		bullet.target_group = "player"
		get_parent().add_child(bullet)
		bullet.look_at(bullet.global_position + bullet.direction, Vector3.UP)

func take_damage(amount):
	health -= amount
	if health <= 0:
		queue_free()
