extends Node
class_name AnimationComponent

@export_subgroup("Nodes")
@export var sprite: AnimatedSprite2D
var chance = 0.75



func horizontal_flip(move_direction: float) -> void:
	if move_direction == 0:
		return
	
	sprite.flip_h = false if move_direction > 0 else true
func move_animation(move_direction: float) -> void:
	horizontal_flip(move_direction)
	
	if move_direction != 0:
		sprite.play("run")
	else:
		sprite.play("idle")	
		
func jump_animation(is_jumping: bool, is_falling: bool):
	if  is_jumping:
		sprite.play("jump 2") 
	if is_falling:
		sprite.play("jump 1")

 
