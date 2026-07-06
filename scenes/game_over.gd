extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$score.text = ("Score: %d" % Global.score)


func _on_button_button_up():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
