extends Node2D
var score =0
var tree_health = 5000
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if score == 4:
		get_tree().change_scene_to_file("res://level_2.tscn")

func increase_dead():
	score += 1
	print(score)
	

func exit_to_main():
	get_tree().change_scene_to_file("res://main.tscn")
