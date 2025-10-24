@tool
extends Node

@export_tool_button("check") var button_test = func():
	print("FUCK")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func processEnemies(level : Level) -> void:
	for e in level.enemies:
		get_tree().create_timer(e.time_offset).timeout.connect(
		func ():
			var cpy = e
			makeEnemy(cpy) # <----
		)
	pass

func makeEnemy(e : EnemyData):
	print(e.enemy_scene)
	#var newEnemy : Node3D = load(e.enemy_scene).instantiate()
	#add_child(newEnemy)
	# [give track to enemy]
	#newEnemy.position = newEnemy.position_offset
	pass