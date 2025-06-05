extends Label


func _process(_delta: float) -> void:
	var accel: Vector3 = Input.get_accelerometer()
	var grav_correction: Vector3 = accel.normalized() * 9.8
	var plane_motion: Vector2 = Vector2((accel - grav_correction).x, (accel - grav_correction).y)
	text = str(plane_motion)
	if max(abs(plane_motion.x), abs(plane_motion.y)) > 3:
		self_modulate = Color(1.0, 0.0, 0.0)
		$Label.text = str(plane_motion)
	else:
		self_modulate = Color(1.0, 1.0, 1.0)
		
