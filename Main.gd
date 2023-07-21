extends Node2D

func _on_start_pressed():
	#get_tree().change_scene("res://scenes/Level1.tscn")
	print("Start")

func _on_quit_pressed():
	get_tree().quit()
	print("Quit")
