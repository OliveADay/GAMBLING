extends Label
var money = 100
signal dollar_spent(amount)
signal backrupt
signal kicked_out

func _process(delta: float) -> void:
	text = "$"+str(money)



func _on_5_dollar_down() -> void:
	money-=5
	dollar_spent.emit(5) # Replace with function body.


func _on_20_dollar_down() -> void:
	money-=20
	dollar_spent.emit(20) # Replace with function body.


func _on_100_dollar_down() -> void:
	dollar_spent.emit(100)
	money-=100 # Replace with function body.


func _on_icons_result_found(amount: Variant) -> void:
	money+=amount # Replace with function body.
	if money <= 0:
		backrupt.emit()
	if money > 200:
		kicked_out.emit()
