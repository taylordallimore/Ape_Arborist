extends Node2D

func _on_start_pressed():
	get_tree().change_scene_to_file("res://level_1.tscn")

func _on_test_pressed():
	print("Test")
	#get_tree().change_scene_to_file("res://level_1.tscn")

	get_tree().change_scene_to_file("res://test_scene.tscn")

func _on_quit_pressed():
	get_tree().quit()


func _on_crawf_pressed():
	get_tree().change_scene_to_file("res://crawfTest.tscn")

