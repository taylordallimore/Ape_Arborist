extends Area2D

var direction : Vector2 = Vector2.RIGHT
var speed : float = 400
var grav : float = 0.55
@onready var anim = get_node("AnimationPlayer")


func _physics_process(delta):
	position += direction * speed * delta
	direction.y += grav * delta
	anim.play("Fling")

func _on_screen_exited():
	queue_free()


func _on_body_entered(body:Node2D):
	# pass # Replace with function body.
	if body.is_in_group("t"):
		body.kill()
		queue_free()
