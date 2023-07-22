extends Marker2D


signal spawned(spawn)

@export var spawnling_scene: PackedScene

const level1MaxSpawn = 15
var level1Spawned = 0

func spawn():
	var spawnling = spawnling_scene.instantiate()
	add_child(spawnling)
	return spawnling

func _on_timer_timeout():
	if level1Spawned >= level1MaxSpawn:
		return
	spawn() 
	level1Spawned += 1


	
		

	
