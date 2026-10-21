#extends CharacterBody2D
#var speed = 500
#var jump_speed = 10
#var gravity = 200
#
## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
#func _physics_process(delta: float) -> void:
	#velocity.y += 2
extends CharacterBody2D

@export var run_speed := 260.0
@export var acceleration := 1600.0
@export var deceleration := 2200.0
@export var jump_speed := 430.0
@export var gravity := 220.0

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("move_left", "move_right")
	var target_speed := direction * run_speed
	var rate := acceleration if direction != 0.0 else deceleration
	velocity.x = move_toward(velocity.x, target_speed, rate * delta)
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_speed
	move_and_slide()
