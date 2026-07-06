extends Node2D


var rng = RandomNumberGenerator.new()
var asteroid = preload("res://scenes/asteroid.tscn")
@onready var scoreLabel = $CanvasLayer/score


func _ready():
	$CanvasLayer/healthBar.max_value = Global.playerMaxHealth
	$CanvasLayer/healthBar.value = Global.playerHealth
	
	spawnAstroid()
	spawnAstroid()
	spawnAstroid()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scoreLabel.text = ("Score: %d" % Global.score)
	$CanvasLayer/healthBar.value = Global.playerHealth
	print(Global.playerHealth)



func spawnAstroid():
	var newAstroid = asteroid.instantiate()
	var spawnSide = rng.randi_range(1,2)
	if(spawnSide==1): # Left side of arena
		newAstroid.position.x = -1250
		newAstroid.position.y = randf_range(-550,550)
	elif(spawnSide==2): # Right side of arena
		newAstroid.position.x = 1250
		newAstroid.position.y = randf_range(-550,550)
	get_tree().current_scene.add_child(newAstroid)
