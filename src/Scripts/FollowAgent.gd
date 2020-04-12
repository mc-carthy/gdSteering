extends KinematicBody2D

const DISTANCE_THRESHOLD: float = 3.0

onready var sprite: Sprite = $TriangleRed

export var max_speed: float = 500.0

var velocity: Vector2 = Vector2.ZERO

func _physics_process(delta):
	var target_global_positon: Vector2 = get_global_mouse_position()
	
	if global_position.distance_to(target_global_positon) < DISTANCE_THRESHOLD:
		return
		
	velocity = Steering.follow(
		velocity,
		global_position,
		target_global_positon,
		max_speed
	)
	velocity = move_and_slide(velocity)
	sprite.rotation = velocity.angle()
