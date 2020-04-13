extends KinematicBody2D

const ARRIVE_THRESHOLD: float = 3.0

onready var sprite: Sprite = $TriangleRed
onready var target: Node = get_node(target_path)

export var target_path: NodePath = NodePath()
export var follow_offset: float = 100.0
export var max_speed: float = 500.0

var velocity: Vector2 = Vector2.ZERO

func _physics_process(delta):
	if target == self:
		set_physics_process(false)

	var target_global_positon: Vector2 = target.global_position
	var to_target: float = global_position.distance_to(target_global_positon)
	
	
	if to_target < ARRIVE_THRESHOLD:
		return

	var follow_global_position: Vector2 = (target_global_positon - 	(target_global_positon - global_position).normalized() * follow_offset
		if to_target > follow_offset
		else global_position
	)

	velocity = Steering.arrive_to(
		velocity,
		global_position,
		follow_global_position,
		max_speed,
		200.0
	)
	velocity = move_and_slide(velocity)
	sprite.rotation = velocity.angle()
