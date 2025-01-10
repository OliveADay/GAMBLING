extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_texture_button_button_down() -> void:
	frame = 1 # Replace with function body.
	$TextureButton.visible = false




func _on_icons_result_found(amount: Variant) -> void:
	frame = 0 # Replace with function body.
	$TextureButton.visible = true
