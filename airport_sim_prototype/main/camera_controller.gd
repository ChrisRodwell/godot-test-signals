extends Camera2D

@export var zoom_speed: float = 0.05
@export var zoom_min: float = 0.2
@export var zoom_max: float = 2.0
@export var move_speed: float = 500.0
@export var zoom_smooth_speed: float = 5.0

var zoomTarget: Vector2 = Vector2(1.0, 1.0)


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoomTarget *= Vector2(1 - zoom_speed, 1 - zoom_speed)
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoomTarget *= Vector2(1 + zoom_speed, 1 + zoom_speed)

		zoomTarget.x = clamp(zoomTarget.x, zoom_min, zoom_max)
		zoomTarget.y = clamp(zoomTarget.y, zoom_min, zoom_max)


func _process(delta):
	zoom = zoom.slerp(zoomTarget, zoom_smooth_speed * delta)
	
	var movement = Vector2.ZERO

	if Input.is_action_pressed("ui_up"):
		movement.y -= 1
	if Input.is_action_pressed("ui_down"):
		movement.y += 1
	if Input.is_action_pressed("ui_left"):
		movement.x -= 1
	if Input.is_action_pressed("ui_right"):
		movement.x += 1

	movement = movement.normalized()
	position += movement * delta * move_speed * (1 / zoom.x)
