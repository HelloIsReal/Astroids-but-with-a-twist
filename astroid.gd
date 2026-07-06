extends Area2D


var rng = RandomNumberGenerator.new()
var targetPosition = Vector2(rng.randi_range(-900,900),rng.randi_range(-450,450))
var speed = rng.randf_range(200,500)
var minimumSpeed = 50
var rotationSpeed = rng.randi_range(1,5)
var astroidHealth = randi_range(1,3)
var canMove=false
var asteroidSprites = []

func _ready():
	Global.remainingAsteroids+=1
	look_at(targetPosition)
	$lifeSpan.start()
	
	
	$spawnTimer.wait_time = rng.randf_range(0,4)
	$spawnTimer.start()
	asteroidSprites.append(preload("res://sprites/astroids/asteroid-1.png"))
	asteroidSprites.append(preload("res://sprites/astroids/asteroid-2.png"))
	asteroidSprites.append(preload("res://sprites/astroids/asteroid-3.png"))
	asteroidSprites.append(preload("res://sprites/astroids/asteroid-4.png"))
	
	$Icon.texture = asteroidSprites[randi() % asteroidSprites.size()]
	
func _physics_process(delta):
	if(canMove):
		position += transform.x * speed * delta
		$Icon.rotation += rotationSpeed * delta
		if(speed>minimumSpeed):
			speed -= 0.5



func _on_area_entered(area):
	if(area.is_in_group("bullet")):
		$hitSound.play(0.85)
		$lifeSpan.start()
		astroidHealth -= 1
	if(area.is_in_group("player")):
		astroidHealth=0
		queue_free()
	if(astroidHealth<=0):
			get_tree().current_scene.get_node("destroyedsfx").play(0.85)
			Global.score+=1
			Global.remainingAsteroids-=1
			queue_free()




func _on_spawn_timer_timeout():
	canMove=true


func _on_life_span_timeout():
	Global.remainingAsteroids-=1
	#print(Global.remainingAsteroids)
	queue_free()
