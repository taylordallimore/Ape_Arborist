extends Marker2D


signal spawned(spawn)


@export var spawnling_scene: PackedScene
@onready var daddy = get_parent()
const level1MaxSpawn = 15
var level1Spawned = 0

func spawn():
	if level1Spawned >= level1MaxSpawn:
		return
	level1Spawned += 1
	var spawnling = spawnling_scene.instantiate()
	add_child(spawnling)
	return spawnling

func _on_timer_timeout():
	spawn() 

func increase_dead():
	daddy.increase_dead()	
	
		

	


	
		

	


	
		

	
