extends Node2D
var spin = false
var spin_time = 2
var icon_dur = 0.05
var spin_current_time = 0
var icon_current_time = 0
var jackpot_played_once = false
var rng = RandomNumberGenerator.new()
signal result_found(amount)
var bet = 0
var results: Array[int] = [0,0,0]
var total = 0
signal jackpot

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if spin_current_time > 0:
		jackpot_played_once = true
		if icon_current_time > 0:
			icon_current_time -= delta
		else:
			total = bet
			icon_current_time = icon_dur
			$icon_1.frame = rng.randi_range(0,15)
			$icon_2.frame = rng.randi_range(0,15)
			$icon_3.frame = rng.randi_range(0,15)
						
							
			$AudioStreamPlayer2D.play()
		spin_current_time-=delta
	else:
		if jackpot_played_once:
			jackpot_played_once = false
			results = [$icon_1.frame,$icon_2.frame,$icon_3.frame]
			for result in results:
				if result == 0:
					result = 1
			var multipler:int = 0
			var was_more = false
			if results[0] == results[1] or results[0] == results[2]:
				multipler += results[0]
				was_more = true
				$AudioStreamPlayer2D2.play()
			if results[1] == results[2]:
				multipler += results[1]
				was_more = true
				$AudioStreamPlayer2D2.play()
			if results[0] != results[1] and results[0] != results[2] and results[1] != results[2]:
				was_more = false
				$AudioStreamPlayer2D3.play()
			if !was_more:
				total = 0
			else:
				total = multipler*bet
				jackpot.emit()
			result_found.emit(total)
			bet = 0
		icon_current_time = 0
		
			
		
			
		


func _on_button_button_down() -> void:
	spin_current_time = spin_time # Replace with function body.


func _on_label_dollar_spent(amount: Variant) -> void:
	bet += amount # Replace with function body.
