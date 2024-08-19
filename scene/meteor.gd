extends Area2D

var speed : int
var rotation_speed : int
var x_direction : float

signal collision

func _ready():
	var rng := RandomNumberGenerator.new()
	
	#texture
	
	var path: String = "res://BG_graphic/meteor" + str(rng.randi_range(2,3)) + ".png"
	$Sprite2D.texture = load(path)
	scale = scale * 0.8
	
	#start position
	var width = get_viewport().get_visible_rect().size[0]
	var x_random = rng.randi_range(0,width)
	var y_random = rng.randi_range(-150,-50)
	position = Vector2(x_random, y_random)
	
	#speed / rotation / direction
	speed = rng.randi_range(200, 500)
	rotation_speed = rng.randi_range(100, 300)
	x_direction = rng.randf_range(-1, 1)
	
func _process(delta):
	position += Vector2(x_direction, 1.0) * speed * delta
	rotation_degrees += rotation_speed * delta
	
	
func _on_body_entered(body):
	collision.emit()


