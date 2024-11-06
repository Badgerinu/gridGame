extends Sprite2D

@export var target_width: float = 32.0
@export var target_height: float = 32.0

func _ready():
	set_size_in_pixels(Vector2(target_width, target_height))

# Function to adjust sprite to a specific pixel size
func set_size_in_pixels(target_size: Vector2) -> void:
	if texture:  # Ensure there's a texture assigned
		var original_size = texture.get_size()
		
		# Calculate the required scale to reach the target size
		scale.x = target_size.x / original_size.x
		scale.y = target_size.y / original_size.y
