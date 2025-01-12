extends TileMapLayer

@export var test_seed: int = 12345
@export var grass_tile_id: Vector2i = Vector2i(0, 0)
@export var dirt_tile_id: Vector2i = Vector2i(0, 3)
@export var source_id: int = 1

var noise: FastNoiseLite


func generate_terrain() -> void:
	print("Generating Terrain")
	
	noise = FastNoiseLite.new()
	noise.seed = test_seed
	noise.noise_type = FastNoiseLite.TYPE_PERLIN 
	noise.frequency = 0.1

	for x in range(WorldSettings.grid_width):
		for y in range(WorldSettings.grid_height):	
			var noise_value = noise.get_noise_2d(x, y)	
			var tile_id = grass_tile_id if noise_value > 0 else dirt_tile_id
			
			set_cell(Vector2i(x, y), source_id, tile_id) 
