extends Label

func _on_audio_stream_player_2d_finished() -> void:
	visible = false # Replace with function body.


func _on_icons_jackpot(multipler: int) -> void:
	visible =true
	text = "$"+str(multipler) # Replace with function body.
