@tool
extends Node2D

var world_settings = WorldSettings
var camera: Camera2D = null


# Initialize the world manager with the camera
func initialize(main_camera: Camera2D) -> void:
	camera = main_camera
	setup_world()


func setup_world() -> void:
	align_grid()
	generate_terrain()


# Align background and grid based on the camera position
func align_grid() -> void:
	var grid_center = Vector2(world_settings.grid_width * world_settings.cell_size / 2, world_settings.grid_height * world_settings.cell_size / 2)

	if camera:
		camera.position = grid_center
	
	
func generate_terrain() -> void:
	var terrain = $TerrainLayer
	terrain.generate_terrain()
