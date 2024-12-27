extends Area2D
var polarity = "left"
func _on_body_entered(body):
	if (body.has_method("setPolar")):
		body.setPolar("left")
		var sprite = get_node(body.AnimatedSprite2D)
		sprite.play("new_animation")
		print("this works")
