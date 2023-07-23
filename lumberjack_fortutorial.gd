extends CharacterBody2D


const SPEED = 0
# const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var health = 100

# State of the lumberjack.
var alive = true
var attacking = false

@onready var anim = get_node("AnimationPlayer")

func _ready():
	velocity.x -= 0

func kill():
	alive = false
	anim.play("Dead")

func start_attack():
	attacking = true
	anim.play("Attack")
	

func _physics_process(delta):
	# Add the gravity.
	if not alive or attacking:
		return
	# print(velocity.x) 
	if not is_on_floor():
		velocity.y += gravity * delta
		anim.play("Walk")

	move_and_slide()