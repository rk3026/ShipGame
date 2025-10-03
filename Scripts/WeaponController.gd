extends Node
class_name WeaponController

@export var shoot_cooldown: float = 0.1
@export var bullet_speed: float = 30.0
@export var damage: int = 2

var shoot_timer: float = 0.0
var parent_body: CharacterBody3D

func _ready():
	parent_body = get_parent() as CharacterBody3D

func _process(delta):
	shoot_timer -= delta

func try_shoot():
	if shoot_timer <= 0:
		shoot()
		shoot_timer = shoot_cooldown

func shoot():
	var bullet_scene = preload("res://Scenes/bullet.tscn")
	var bullet = bullet_scene.instantiate()
	bullet.position = parent_body.global_position + parent_body.transform.basis.z * 2
	bullet.direction = parent_body.transform.basis.z
	bullet.speed = bullet_speed
	bullet.damage = damage
	bullet.target_group = "enemy"
	parent_body.get_parent().add_child(bullet)
	bullet.look_at(bullet.global_position + bullet.direction, Vector3.UP)