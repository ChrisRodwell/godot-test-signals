@tool
extends Node2D

var world_settings = WorldSettings


func _ready() -> void:
	queue_redraw()


func _draw() -> void:
	var width = WorldSettings.grid_width
	var height = WorldSettings.grid_height
	var cell_size = WorldSettings.cell_size
	
	var line_color = Color(1, 1, 1, 0.5)
	var border_color = Color(1, 0, 0, 0.5) 
	var border_width = 3.0

	# Draw vertical grid lines
	for x in range(width + 1):
		var start_point = Vector2(x * cell_size, 0)
		var end_point = Vector2(x * cell_size, height * cell_size)
		draw_line(start_point, end_point, line_color)
	# Draw horizontal grid lines
	for y in range(height + 1):
		var start_point = Vector2(0, y * cell_size)
		var end_point = Vector2(width * cell_size, y * cell_size)
		draw_line(start_point, end_point, line_color)

	# Top border
	draw_line(Vector2(0, 0), Vector2(width * cell_size, 0), border_color, border_width)
	# Bottom border
	draw_line(Vector2(0, height * cell_size), Vector2(width * cell_size, height * cell_size), border_color, border_width)
	# Left border
	draw_line(Vector2(0, 0), Vector2(0, height * cell_size), border_color, border_width)
	# Right border
	draw_line(Vector2(width * cell_size, 0), Vector2(width * cell_size, height * cell_size), border_color, border_width)
