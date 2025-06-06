extends Label


func _process(_delta: float) -> void:
	text = str($"../../Ball".linear_velocity.length())
