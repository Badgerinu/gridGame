extends Node
const TILE_SIZE: int = 32

var grid_logic = AStarGrid2D


func init_level(tile_map:TileMap):
	grid_logic = AStarGrid2D.new()
	grid_logic.cell_size = Vector2i.ONE * TILE_SIZE
	grid_logic.region = tile_map.get_used_rect()
	grid_logic.update()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func click_on_tile(pos: Vector2, include_half_offset: bool = false) -> Vector2:
	var click = floor(pos / float(TILE_SIZE)) * TILE_SIZE #top legt cords of cell
	
	if include_half_offset:
		click += Vector2.ONE * TILE_SIZE * 0.5 #the center of clicked cell
	return click


func global_to_cell(pos:Vector2)-> Vector2:
	return click_on_tile(pos) / TILE_SIZE


func cell_to_global(pos:Vector2,include_half_offset: bool = false)->Vector2:
	return click_on_tile(pos * TILE_SIZE, include_half_offset)



