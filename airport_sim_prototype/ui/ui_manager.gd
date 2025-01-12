extends CanvasLayer

signal build_mode_button_pressed

func _on_build_mode_button_pressed() -> void:
	print("Build Mode button pressed!")
	build_mode_button_pressed.emit()
