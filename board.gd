extends Node3D


# Signals
func _on_in_game_ui_flip(is_right: bool, release: bool) -> void:
	var target: Flipper = %LeftFlipper
	if is_right:
		target = %RightFlipper
	if release:
		target.release()
	else:
		target.flip()
