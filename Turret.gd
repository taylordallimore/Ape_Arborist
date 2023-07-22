extends Node2D
@onready var ray_cast = $RayCast2D
@onready var timer = $Timer
@export var ammo : PackedScene
@onready var animation = get_node("AnimationPlayer")

var can_fire = true
var player

func _ready():
	player = get_parent().find_child("player")
	

func _physics_process(_delta):
	
	_aim() #aim at player
	
	if Input.is_action_pressed("ui_accept"):
		if can_fire:
			animation.play("Throw")
			_shoot()
			
		
# func _input(event):
# 	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
# 	# Get the current mouse position relative to the global coordinate system
# 		var mouse_position = get_global_mouse_position()
# 		print("Mouse Position: ", mouse_position)
			
func _aim():
	#ray_cast.target_position = to_local(player.position)
	ray_cast.target_position = get_local_mouse_position()

func _on_timer_timeout():
	can_fire = true



func _shoot():
	var bullet = ammo.instantiate()
	bullet.position = position
	bullet.direction = (ray_cast.target_position).normalized()
	get_tree().current_scene.add_child(bullet)
	can_fire = false
	timer.start()
	
