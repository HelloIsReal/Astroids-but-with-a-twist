extends CharacterBody2D

const SPEED = 500.0
var bullet = preload("res://scenes/bullet.tscn")
var canShoot=true


func _physics_process(delta):
	Global.playerPosition = position
	movement()
	move_and_slide()
	look_at(get_global_mouse_position())
	if(Input.is_action_pressed("shoot") && canShoot):
		canShoot=false
		$shootCooldown.start()
		var newBullet = bullet.instantiate()
		newBullet.global_position = global_position
		get_tree().current_scene.add_child(newBullet)
		


func movement():
	var direction = Input.get_vector("left", "right","up","down")
	velocity = direction * SPEED


func _on_shoot_cooldown_timeout():
	canShoot=true
