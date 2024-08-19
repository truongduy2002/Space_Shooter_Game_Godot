extends Area2D

@export var speed = 300

func _ready():
	var tween = create_tween()
	tween.tween_property($Sprite2D, 'scale', Vector2(1,1), 2.0).from(Vector2(0.2,0.2))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= speed * delta


func _on_area_entered(area):
	area.queue_free()
	queue_free()
