extends Node2D
@onready var ray_cast = $RayCast2D
@onready var timer = $Timer
@export var ammo : PackedScene
@onready var animation = get_node("AnimationPlayer")

var can_fire = true
var player
var poop = false
var home = null



func _ready():
	player = get_parent().find_child("player")
	

func _physics_process(_delta):
	if home != null:
		if not home.alive:
			fall()
	
	_aim() #aim at player
	
	if Input.is_action_pressed("ui_accept"):
		if can_fire:
			animation.play("Throw")
			_shoot()

func _input(event):
	_aim() #aim at player
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if can_fire:
				animation.play("Throw")
				_shoot()

			
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

func set_home(h:Node2D):
	if home == null:
		home = h

func fall(): 
	queue_free()

