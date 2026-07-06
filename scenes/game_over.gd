extends Node2D

func _ready():
	$score.text = ("Score: %d" % Global.score)

func _on_button_button_up():
	Global.playerHealth=10
	Global.currentWave=0
	get_tree().change_scene_to_file("res://scenes/main.tscn") 
	
