extends CharacterBody2D


const SPEED = 1.0
# const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var health = 100

@onready var anim = get_node("AnimationPlayer")

func _ready():
	velocity.x -=  100 *SPEED


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if health <= 0:
		anim.play("Death")
		velocity.x = 0
		velocity.y = 0
		rotation_degrees = 90
		return


	if velocity.x == 0:
		anim.play("Hit")
	else:
		anim.play("Walk")
			
			##
	move_and_slide()
			
			# Handle Jump.
			# if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			# 	velocity.y = JUMP_VELOCITYS
		
			# Get the input direction and handle the movement/deceleration.
			# As good practice, you should replace UI actions with custom gameplay actions.
			# var direction = Input.get_axis("ui_left", "ui_right")
			# if direction == -1:
			# 	get_node("AnimatedSprite2D").flip_h = true
			# elif direction == 1:
			# 	get_node("AnimatedSprite2D").flip_h = false
			# if direction:
			# 	
			# 	anim.play("Walk")
			# else:
			# 	velocity.x = move_toward(velocity.x, 0, SPEED)