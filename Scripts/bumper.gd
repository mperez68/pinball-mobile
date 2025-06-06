@tool
extends Node3D

@export var has_top: bool = true

func _process(delta: float) -> void:
	$Top.visible = has_top
