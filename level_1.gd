extends Node2D


# var max_lumberjacks = 0
var total_lumberjacks = 0
@onready var lumberjacks = []
# Called when the node enters the scene tree for the first time.
func _ready():
	$Spawner2D.spawn()
	lumberjacks.append($Spawner2D)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):	 

		
	if  lumberjacks.size() < 14:
		lumberjacks.append(1)
		total_lumberjacks += 1

	# if lumberjacks.size()== 15:
	# 	get_tree().change_scene_to_file("res://level_2.tscn")

		


