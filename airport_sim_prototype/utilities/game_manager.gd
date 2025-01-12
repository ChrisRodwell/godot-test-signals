extends Node

func _ready() -> void:
	UIManager.build_mode_button_pressed.connect(_build_mode_set)

func _build_mode_set() -> void:
	print("GameManager received button press!")
