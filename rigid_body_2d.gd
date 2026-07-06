extends RigidBody2D


var strengthForce: float = 500

# Called when the node enters the scene tree for the first time.
#func _ready():
	#look_at(Main.playerPosition)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction = global_position.direction_to(Main.playerPosition)
	var force = direction * strengthForce
	apply_central_force(force)
	#velocity += 100
