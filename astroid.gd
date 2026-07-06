extends Area2D


var rng = RandomNumberGenerator.new()
#var playerPosition = Vector2(0,0)
#var targetPosition = Vector2(rng.randf-range(-900.0,900.0),rng.randf_range(-450.0,450.0))
var targetPosition = Vector2(rng.randi_range(-900,900),rng.randi_range(-450,450))
#var targetPosition = Vector2(500,200)
var speed = rng.randf_range(200,500)
var minimumSpeed = 50
var rotationSpeed = rng.randi_range(1,5)
var astroidHealth=3
var canMove=false

func _ready():
	look_at(targetPosition)
	print(targetPosition)
	$spawnTimer.wait_time = rng.randf_range(0,4)
	$spawnTimer.start()

# Called every frame. 'delta' is th e elapsed time since the previous frame.
func _physics_process(delta):
	if(canMove):
		position += transform.x * speed * delta
		$Icon.rotation += rotationSpeed * delta
		if(speed>minimumSpeed):
			speed -= 0.5
			


func _on_area_entered(area):
	if(area.is_in_group("bullet")):
		astroidHealth -= 1
		if(astroidHealth<=0):
			print("astroid explode!")
			Global.score+=1
			queue_free()


func _on_spawn_timer_timeout():
	canMove=true
