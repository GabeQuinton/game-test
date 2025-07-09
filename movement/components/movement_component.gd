class_name MovementComponent
extends Node

@export_subgroup("Settings")
@export var move_speed: float = 50000

func handle_horizontal_movement(body: CharacterBody2D, direction: float, delta: float) -> void:
	body.velocity.x = direction * move_speed * 300  * delta
