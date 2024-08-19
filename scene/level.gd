extends Node2D

# load the scene
var meteor_scene: PackedScene = load("res://scene/meteor.tscn")
var laser_scene: PackedScene = load("res://scene/laser.tscn")

var health : int = 5

func _ready():
	#set the health
		get_tree().call_group('ui', 'set_health', health)
	

func _on_meteor_timer_timeout():
	# create an instance
	var meteor = meteor_scene.instantiate()
	
	# attach the node to the scene tree
	$meteors.add_child(meteor)
	
	#connect collision from meteor scene
	meteor.connect('collision', on_meteor_collision)
	
func on_meteor_collision():
	health -= 1
	get_tree().call_group('ui', 'set_health', health)
	if health <= 0:
		get_tree().change_scene_to_file("res://scene/GameOver.tscn")


func _on_player_laser(pos):
	#create an instantiate
	var lasers = laser_scene.instantiate()
	
	#attach the node to the scene tree
	$Lasers.add_child(lasers)
	lasers.position = pos
	print(lasers.position)
	



