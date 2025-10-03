extends Node
class_name HealthComponent

@export var max_health: int = 10
var current_health: int

signal health_changed(new_health: int)
signal died

func _ready():
	current_health = max_health

func take_damage(amount: int):
	current_health -= amount
	health_changed.emit(current_health)
	if current_health <= 0:
		died.emit()
		get_parent().queue_free()