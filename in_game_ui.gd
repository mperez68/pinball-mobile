extends CanvasLayer

signal flip(is_right: bool, release: bool)


# Engine
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("reset"):
		_on_button_pressed()


# Signals
func _on_flipper_button_pressed(is_right: bool) -> void:
	flip.emit(is_right, false)

func _on_flipper_button_button_up(is_right: bool) -> void:
	flip.emit(is_right, true)


func _on_button_pressed() -> void:
	get_tree().reload_current_scene()
