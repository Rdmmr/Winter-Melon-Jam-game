extends AnimatableBody2D

const SPEED = 45

var direction = 1

@onready var ray_cast_r = $RayCastR
@onready var ray_cast_l = $RayCastL
@onready var animated_sprite = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !ray_cast_r.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if !ray_cast_l.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	position.x += direction * SPEED * delta
