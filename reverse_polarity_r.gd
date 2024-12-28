extends Area2D
var polarity = "left"
func _on_body_entered(body):
	if (body.has_method("setPolar")):
		body.setPolar("right")
	if (body.has_node("AnimatedSprite2D")):
		body.get_node("AnimatedSprite2D").play("RPull");

		print("this works")
