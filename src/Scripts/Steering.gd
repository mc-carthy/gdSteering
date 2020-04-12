extends Node

const DEFAULT_MASS: float = 2.0
const DEFAULT_MAX_SPEED: float = 2.0

static func follow(
	velocity: Vector2,
	global_position: Vector2,
	target_position: Vector2,
	max_speed: float = DEFAULT_MAX_SPEED,
	mass: float = DEFAULT_MASS
) -> Vector2:
	var desired_velocity: Vector2 = Vector2(target_position - global_position).normalized() * max_speed
	var steering: Vector2 = (desired_velocity - velocity) / mass
	return velocity + steering
