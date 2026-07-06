extends Area2D

var bulletSpeed = 3000


func _ready():
	look_at(get_global_mouse_position())

func _process(delta):
	position += transform.x * bulletSpeed * delta

func _on_area_entered(area):
	if(area.is_in_group("asteroid")):
		queue_free()
