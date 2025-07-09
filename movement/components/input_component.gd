class_name	InputComponent
extends Node

var input_horizontal: float = 0.0

func get_jump_input() -> bool:
	return Input.is_action_pressed("jump")

func _process(delta: float) -> void:
	input_horizontal = Input.get_axis("input_left", "input_right")
	
