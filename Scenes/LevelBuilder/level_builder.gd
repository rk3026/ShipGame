@tool
extends Node3D

@export var filename : String :
	set(value):
		filename = value
		notify_property_list_changed()
@export var test : bool :
	set(value):
		test = value
		notify_property_list_changed()
@export var slider : float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _set(property: StringName, value) -> bool:
	print("_set() + %s" % property)
	if property == &"fuck":
		
		set(property, value)
		return true
	return false

func test_func() -> void:
	print("FUCK!!!")

func _validate_property(property: Dictionary) -> void:
	match property.name:
		"test":
			if filename:
				print("we get here")
				property.usage = PROPERTY_USAGE_NO_EDITOR
		"filename":
			property.hint = PROPERTY_HINT_DIR
		"slider":
			property.hint = PROPERTY_HINT_RANGE
			property.hint_string = "0,200,0.5"

func _get_property_list() -> Array[Dictionary]:
	var properties : Array[Dictionary] = []
	if test:
		properties.append({
			"name" : "fuck",
			"type" : TYPE_CALLABLE,
			"usage" : PROPERTY_USAGE_EDITOR,
			"hint" : PROPERTY_HINT_TOOL_BUTTON,
			"hint_string" : "TEST"
		})
	return properties

