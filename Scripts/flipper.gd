class_name Flipper extends RigidBody3D

var swing_torque = Vector3(0,500,0)

@export_enum("Left", "Right") var direction: int
var trigger_action: StringName = "left_flipper"


# Engine
func _ready() -> void:
	if direction > 0:
		swing_torque *= -1
		trigger_action = "right_flipper"


# Public
func flip():
	constant_torque = swing_torque

func release():
	constant_torque = Vector3.ZERO
	apply_torque_impulse(-swing_torque / 2)
