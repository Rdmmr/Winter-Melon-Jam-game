extends Area2D
var polarity = "left"
func _on_body_entered(body):
	if (body.has_method("setPolar")):
		body.setPolar("right")
		body.AnimatedSprite2D.play("new_animation")
		print("this works")
