extends Node2D

@onready var tile_map = $TileMap

var grid_bounds

func _ready():
	Nevigation.init_level(tile_map)
	update_grid_bounds()


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var cell = Nevigation.global_to_cell(get_global_mouse_position())
		update_grid_bounds()
		# Only proceed if cell falls within bounds
		if cell.x >= grid_bounds["min_x"] and cell.x <= grid_bounds["max_x"] and cell.y >= grid_bounds["min_y"] and cell.y <= grid_bounds["max_y"]:
			# Clamp cell within the bounds, just in case
			cell.x = clamp(cell.x, grid_bounds["min_x"], grid_bounds["max_x"])
			cell.y = clamp(cell.y, grid_bounds["min_y"], grid_bounds["max_y"])
			print(cell)

func update_grid_bounds():
	grid_bounds = clamp_grid()


func clamp_grid() -> Dictionary:
	var tile_bounds = tile_map.get_used_rect()
	return {
		"min_x": tile_bounds.position.x,
		"min_y": tile_bounds.position.y,
		"max_x": tile_bounds.position.x + tile_bounds.size.x - 1,
		"max_y": tile_bounds.position.y + tile_bounds.size.y - 1
	}
