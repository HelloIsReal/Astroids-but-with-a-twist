extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta):
	movement()
	move_and_slide()
	look_at(get_global_mouse_position())
	if(Input.is_action_just_pressed("shoot")):
		print("bang!")


func movement():
	var direction = Input.get_vector("left", "right","up","down")
	velocity = direction * SPEED
