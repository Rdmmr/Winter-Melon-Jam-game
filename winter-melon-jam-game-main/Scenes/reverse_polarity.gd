extends Area2D
var polarity = "left"
func _on_body_entered(body):
	if (body.has_method("setPolar")):
		body.setPolar("left")
	if (body.has_node("AnimatedSprite2D")):
		body.get_node("AnimatedSprite2D").play("new_animation_1");

		print("this works")
