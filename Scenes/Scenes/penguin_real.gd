extends AnimatableBody2D

var speed = 100

var direction = 1

@onready var ray_cast_r = $RayCastR
@onready var ray_cast_l = $RayCastL
@onready var animated_sprite = $AnimatedSprite2D

func _on_area_2d_body_entered(body):
	if (body.has_method("setPolar")):
		speed = 250
		direction = 1
		animated_sprite.flip_h = false
	
func _on_area_2d_2_body_entered(body):
	if (body.has_method("setPolar")):
		speed = 250
		direction = -1
		animated_sprite.flip_h = true
	

func _on_area_2d_3_body_exited(body):
	if (body.has_method("setPolar")):
		speed = 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !ray_cast_r.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if !ray_cast_l.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	position.x += direction * speed * delta


#func _on_area_2d_4_body_entered(body):
	#if (body.has_method("setPolar")):
		#body.set
