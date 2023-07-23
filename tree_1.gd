extends StaticBody2D
var health = 200
var alive = true
var deadPlayed = false
@onready var animate = get_node("AnimatedSprite2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	animate.play("Alive")
	var mommy = get_parent()
	health = mommy.tree_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		

func damage(n:int):
	if deadPlayed == true:
		return
	if alive==false:
		return
	health -= n
	if health <= 0:
		alive = false
		animate.play("Fall")
		deadPlayed = true
		var t = $falltime
		t.start(3)
		



func _on_falltime_timeout():
	get_tree().change_scene_to_file("res://GAME_OVER.tscn")
