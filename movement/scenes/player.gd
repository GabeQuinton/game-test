class_name Player
extends CharacterBody2D

@export_subgroup("Nodes")   
@onready var gravity_component: GravityComponent = $GravityComponent
@onready var movement_component: MovementComponent = $MovementComponent
@onready var input_component: InputComponent = $InputComponent
@onready var jump_component: JumpComponenet = $JumpComponenet
@onready var animation_component: AnimationComponent = $AnimationComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	gravity_component.handle_gravity(self, delta)
	
	movement_component.handle_horizontal_movement(self, input_component.input_horizontal, delta)
	
	jump_component.handle_jump(self, input_component.get_jump_input(), gravity_component.gravity)

	animation_component.move_animation(input_component.input_horizontal)
	animation_component.jump_animation(jump_component.is_jumping, gravity_component.is_falling)
	move_and_slide()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_physics_process(delta)
