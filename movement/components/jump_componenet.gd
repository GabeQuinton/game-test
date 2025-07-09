class_name JumpComponenet
extends Node

@export_subgroup("Settings")
@export var jump_speed: float = 590.0
@export var acceleration: float = 890.0
@export var jump_height: float = 100
@export var jumps: int = 2

var jump_count: int = jumps
var can_jump: bool = true
var double_jump: bool = false
var is_jumping: bool = false
var lock: bool = false
var times_jumped: int = 0

func handle_jump(body: CharacterBody2D, try_jump: bool, gravity: float) -> void:
	
	if can_jump == false && body.is_on_floor() || jump_count == times_jumped && body.is_on_floor():
		can_jump = true
		jump_count = jumps
		double_jump = false
		times_jumped = 0
		

	if try_jump && body.is_on_floor() && Input.is_action_just_pressed("jump") && can_jump == true:
		body.velocity.y -= lerp(jump_speed, acceleration, 0.1) + jump_height
		jump_count -= 1
		times_jumped += 1
			
	if body.velocity.y > 0:
		lock = true
		can_jump = false
		if jump_count > 1:
			double_jump = true
	else: 
		lock = false
		
	if ! body.is_on_floor() && Input.is_action_just_released("jump") && can_jump == true && lock == false:
		
		body.velocity.y = lerp(body.velocity.y/3, gravity, 0.1)
		can_jump = false
		double_jump = true
		lock = false
		
	if Input.is_action_just_pressed("jump") && jump_count > 0 && can_jump == false && double_jump == true:
		jump_count -= 1
		times_jumped += 1
		body.velocity.y = -lerp(jump_speed/2.5, acceleration, 0.5)
		double_jump = false
		
	is_jumping = body.velocity.y < 0 && ! body.is_on_floor()	
