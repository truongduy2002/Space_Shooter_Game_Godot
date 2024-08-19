extends Control

var level_scene: PackedScene = load("res://scene/level.tscn")

func _ready():
	$CenterContainer/VBoxContainer/Label2.text = $CenterContainer/VBoxContainer/Label2.text + str(Global.score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		get_tree().change_scene_to_file("res://scene/level.tscn")
	
