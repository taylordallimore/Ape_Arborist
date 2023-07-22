extends Timer


var lumber = preload("res://lumberjack.tscn")
var lumber2 = preload("res://lumberjack.tscn")
var lumber3 = preload("res://lumberjack.tscn")
 

func _on_timeout():
	randomize()
	var lumberjack = lumber.instantiate()
	var lumberjack2 = lumber2.instantiate()
	var lumberjack3 = lumber3.instantiate()
	add_child(lumberjack)
	add_child(lumberjack2)
	add_child(lumberjack3)
	lumberjack.position = Vector2(200, 500)
	lumberjack2.position = Vector2(300, 500)
	lumberjack3.position = Vector2(400, 500)
