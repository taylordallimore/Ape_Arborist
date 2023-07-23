extends CharacterBody2D

var planeHealth = 100

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


var amplitude = randf_range(50,100)  # The amplitude of the sine wave (how high it goes).
var frequency = randf_range(0.5,2.5)  # The frequency of the sine wave (how fast it oscillates).
var speed = randf_range(100,150)  # The speed at which the sprite moves from left to right.
var time_passed = 0

var alive = true
var attacking = false
var target = null


var initial_pos

func _ready():
	initial_pos = position
	print(1)


func _physics_process(delta: float):

	if alive == false: 
		position.y += gravity * delta
		return
	
	time_passed += delta		
	# Calculate the vertical position using the sine wave equation.
	var vertical_position = amplitude * sin(time_passed * frequency) - initial_pos.y
	# Calculate the horizontal position using the character's speed.
	var horizontal_position = speed * time_passed - initial_pos.x
	# Set the character's position based on the sine wave.
	position.x = -horizontal_position
	position.y = -vertical_position

	var slope = amplitude * frequency * cos(time_passed * frequency)

	var angle = atan2(slope, speed)

	rotation = angle
	move_and_slide()


@onready var level = get_parent()

func kill():
	if alive == false:
		return
	alive = false
	fall()
	level.increase_dead()

func start_attacking(tree:Node2D):
	target = tree
	attacking = true
	velocity.x = 0
	target.damage(200)
	alive = false

func fall():
	velocity.y = -2100
