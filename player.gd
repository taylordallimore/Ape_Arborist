extends CharacterBody2D

func _physics_process(_delta):
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * 150
	move_and_slide()


func _on_tree_1_body_entered(body:Node2D):
	print("tree 1")
