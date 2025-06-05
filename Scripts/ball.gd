extends RigidBody3D

const SENSITIVITY: int = 5

@onready var bump: Timer = $BumpTimer

# Engine
func _process(delta: float) -> void:
	var accel: Vector3 = Input.get_accelerometer()
	var grav_correction: Vector3 = accel.normalized() * 9.8
	var plane_motion: Vector2 = Vector2((accel - grav_correction).x, (accel - grav_correction).y)
	if !bump.is_stopped():
		return
	if plane_motion.y > SENSITIVITY:
		apply_force(Vector3(0, 0, -SENSITIVITY))
		bump.start()
	elif plane_motion.x > SENSITIVITY:
		apply_force(Vector3(-SENSITIVITY, 0, 0))
		bump.start()
	elif plane_motion.x < -SENSITIVITY:
		apply_force(Vector3(SENSITIVITY, 0, 0))
		bump.start()
