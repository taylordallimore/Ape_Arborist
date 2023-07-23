extends StaticBody2D
var health = 100
var alive = true
var deadPlayed = false
@onready var animate = get_node("AnimatedSprite2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	animate.play("Alive")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func damage():
	if deadPlayed == true:
		return
	if alive==false:
		return
	health -= 10
	if health <= 0:
		alive = false
		animate.play("Fall")
		deadPlayed = true
		

