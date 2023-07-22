extends Marker2D


signal spawned(spawn)

@export var spawnling_scene: PackedScene


func spawn():
	var spawnling = spawnling_scene.instantiate()
	add_child(spawnling)
	return spawnling

func _on_timer_timeout():
	spawn() 
	
