extends Node2D

var tiles: Array= []

var TileScene = preload("res://Scenes/Maps/Tile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tiles.clear()

	generate_map(100,100)

	var tileset: TileSet = $TileMap.tile_set

	for source_id in tileset.get_source_count():
		var source = tileset.get_source(source_id)
		print("Source ID:", source_id, "Type:",)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func generate_map(rows, cols) -> void:
	tiles.clear()

	print("Generating map")

	var tm: TileMapLayer= $TileMap
	var n: FastNoiseLite= FastNoiseLite.new()
	n.noise_type= FastNoiseLite.TYPE_SIMPLEX
	n.frequency = 0.05
	n.fractal_type = FastNoiseLite.FRACTAL_FBM
	n.fractal_octaves = 2
	n.fractal_lacunarity = 2.0
	n.fractal_gain = 0.6

	for i in range(rows):
		tiles.append([])
		for j in range(cols):
			var v= 	n.get_noise_2d(i, j)

			tm.set_cell(Vector2i(j, i), 1, Vector2i((v > 0.2), 0))
