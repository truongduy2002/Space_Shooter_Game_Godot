extends CanvasLayer

var time_elapse := 0

func set_health(amount):
	#remove all children
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
	
	# create new children amount is set by health
	for i in amount:
		var text_rect = TextureRect.new() 
		text_rect.texture = load("res://graphic_ship/health_ship.png")
		$MarginContainer2/HBoxContainer.add_child(text_rect)
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP


func _on_score_timer_timeout():
	time_elapse += 1
	$MarginContainer/Label.text = str(time_elapse)
	Global.score = time_elapse
