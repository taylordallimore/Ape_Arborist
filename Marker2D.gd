extends Marker2D


signal spawned(spawn)

@export var spawnling_scene: PackedScene


func spawn():
	var spawnling = spawnling_scene.instance()
	spawnling.position = position
	get_parent().add_child(spawnling)
	# queue_free()
