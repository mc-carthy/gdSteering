extends KinematicBody2D

const STOP_DISTANCE_THRESHOLD: float = 3.0
const SLOW_DISTANCE_THRESHOLD: float = 200.0

onready var sprite: Sprite = $TriangleRed

export var max_speed: float = 500.0

var velocity: Vector2 = Vector2.ZERO
var target_global_position: Vector2

func _ready() -> void:
	set_physics_process(false)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed('click'):
		target_global_position = get_global_mouse_position()
		set_physics_process(true)

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed('click'):
		target_global_position = get_global_mouse_position()
	if global_position.distance_to(target_global_position) < STOP_DISTANCE_THRESHOLD:
		set_physics_process(false)
		
	velocity = Steering.arrive_to(
		velocity,
		global_position,
		target_global_position,
		max_speed,
		SLOW_DISTANCE_THRESHOLD
	)
	velocity = move_and_slide(velocity)
	sprite.rotation = velocity.angle()
