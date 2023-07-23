extends Node2D

func _on_start_pressed():
	get_tree().change_scene_to_file("res://notlevel_1.tscn")

func _on_test_pressed():
	print("Test")
	get_tree().change_scene_to_file("res://level_2.tscn")

func on_tut_pressed():
	get_tree().change_scene_to_file("res://tutorial.tscn")
	
func _on_quit_pressed():
	get_tree().quit()

