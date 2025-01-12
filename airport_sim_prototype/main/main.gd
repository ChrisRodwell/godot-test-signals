extends Node2D

@export var camera: Camera2D
@onready var world = $World

func _ready() -> void:
	# Initialize the world manager and set up the game world
	world.initialize(camera)
