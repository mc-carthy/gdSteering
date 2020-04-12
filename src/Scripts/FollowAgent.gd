extends KinematicBody2D

onready var sprite: Sprite = $TriangleRed

export var max_speed: float = 500.0

var velocity: Vector2 = Vector2.ZERO

func _physics_process(delta):
	var target_global_positon: Vector2 = get_global_mouse_position()
	velocity = Steering.follow(
		velocity,
		global_position,
		target_global_positon,
		max_speed
	)
	velocity = move_and_slide(velocity)
