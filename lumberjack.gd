extends CharacterBody2D


const SPEED = 95.0
# const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var health = 100

# State of the lumberjack.
var alive = true
var attacking = false
var target = null
@onready var level = get_parent()
@onready var anim = get_node("AnimationPlayer")

func _ready():
	velocity.x = -randf_range(100,150)  # The speed at which the sprite moves from left to right.


func kill():
	if alive == false:
		return
	alive = false
	anim.play("Dead")
	level.increase_dead()

func start_attacking(tree:Node2D):
	target = tree
	attacking = true
	anim.play("Hit")
	velocity.x = 0
	target.damage(30)
	

func _physics_process(delta):
	# Add the gravity.
	if not alive:
		return
	if attacking:
		if target.alive == false:
			return
		target.damage(30)
		return
	# print(velocity.x) 
	velocity.x = -SPEED

	if not is_on_floor():
		velocity.y += gravity * delta
		anim.play("Walk")

	move_and_slide()

