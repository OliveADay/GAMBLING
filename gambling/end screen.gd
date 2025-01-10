extends Panel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if visible:
		get_tree().paused = true


func _on_button_button_down() -> void:
	get_tree().reload_current_scene() # Replace with function body.


func _on_label_backrupt() -> void:
	visible = true # Replace with function body.
