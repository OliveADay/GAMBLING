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
var results = [0,0,0]
var total = 0

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
			results = [$icon_1.frame,$icon_2.frame,$icon_3.frame]
			var multipler = 0
			if results[0] == results[1] or results[0] == results[2]:
				multipler += results[0]
			if results[1] == results[2]:
				multipler += results[1]
			total+=bet*multipler
						
							
			$AudioStreamPlayer2D.play()
		spin_current_time-=delta
	else:
		if jackpot_played_once:
			$AudioStreamPlayer2D2.play()
			jackpot_played_once = false
			result_found.emit(total)
		icon_current_time = 0
		
			
		
			
		


func _on_button_button_down() -> void:
	spin_current_time = spin_time # Replace with function body.


func _on_label_dollar_spent(amount: Variant) -> void:
	bet += amount # Replace with function body.
