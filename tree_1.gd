extends StaticBody2D
var health = 10000
var alive = true
@onready var animate = get_node("AnimatedSprite2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	animate.play("Alive")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func damage():
	health -= 10
	print("ouch")
	print(health)
	if health <= 0:
		print("dead")
		alive = false
		animate.play("Fall")
		

