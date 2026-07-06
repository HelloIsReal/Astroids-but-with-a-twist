extends CharacterBody2D

const SPEED = 500.0
var bullet = preload("res://scenes/bullet.tscn")
var canShoot=true



func _physics_process(_delta):
	Global.playerPosition = position

	if(position.y<=-655):
		position.y+=10
	elif(position.y>=655):
		position.y-=10
	elif(position.x<=-1155):
		position.x+=10
	elif(position.x>=1155):
		position.x-=10
	else:
		movement()
		
	move_and_slide()
	look_at(get_global_mouse_position())
	if(Input.is_action_pressed("shoot") && canShoot):
		canShoot=false
		$shootCooldown.start()
		var newBullet = bullet.instantiate()
		newBullet.global_position = $Icon.global_position
		get_tree().current_scene.add_child(newBullet)
		


func movement():
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * SPEED


func _on_shoot_cooldown_timeout():
	canShoot=true


func _on_area_2d_area_entered(area):
	if(area.is_in_group("asteroid")):
		$hurtSound.play(0.85)
		Global.playerHealth-=1
		$"../Camera2D".apply_shake()
	if(Global.playerHealth<=0):
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
