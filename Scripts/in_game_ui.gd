extends CanvasLayer

signal flip(is_right: bool, release: bool)


# Engine
func _input(event: InputEvent) -> void:
	if OS.has_feature('debug'):
		if event.is_action_pressed("reset"):
			_on_button_pressed()
		if event.is_action_pressed("debug_left_flipper"):
			flip.emit(false, false)
		elif event.is_action_released("debug_left_flipper"):
			flip.emit(false, true)
		elif event.is_action_pressed("debug_right_flipper"):
			flip.emit(true, false)
		elif event.is_action_released("debug_right_flipper"):
			flip.emit(true, true)

# Signals
func _on_flipper_button_button_down(is_right: bool) -> void:
	flip.emit(is_right, false)

func _on_flipper_button_button_up(is_right: bool) -> void:
	flip.emit(is_right, true)

func _on_button_pressed() -> void:
	get_tree().reload_current_scene()
