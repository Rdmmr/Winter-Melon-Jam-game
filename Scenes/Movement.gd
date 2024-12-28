extends CharacterBody2D


const SPEED := 180.0
const JUMP_VELOCITY := -350.0
var polarity
@onready var coyote_timer = $"Coyote Timer"
@onready var jump_buffer = $"Jump Buffer"
@onready var animated_sprite_2d = $AnimatedSprite2D

const gravity := 1000
const fall_gravity := 1500

func move(direction):
	if (direction == "right"):
		if (velocity.y == 0):
			animated_sprite_2d.play("RPull")
		direction = 1
		velocity.x = direction * SPEED
	elif (direction == "left"):
		if (velocity.y == 0):
			animated_sprite_2d.play("LPull")
		direction = -1
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

func setPolar(x):
	polarity = x
	
func getPolar():
	return polarity
	
func get_gravity(velocity: Vector2):
	if (velocity.y < 0):
		return gravity
	print("falling faster")
	return fall_gravity
	
func _ready():
	setPolar("right")
		
func _physics_process(delta):
	# Add the gravity.
	if is_on_floor():
		animated_sprite_2d.stop()
	if not is_on_floor():
		velocity.y += get_gravity(velocity) * delta
		if Input.is_action_just_pressed("jump"):
			jump_buffer.start()

	# Handle jump.
	if (Input.is_action_just_pressed("jump") and (is_on_floor() || !coyote_timer.is_stopped()) || (is_on_floor() && !jump_buffer.is_stopped())):
		if (polarity == "right"):
			animated_sprite_2d.play("RJump")
		else:
			animated_sprite_2d.play("LJump")
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y = JUMP_VELOCITY / 4 
	move(polarity)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var was_on_floor = is_on_floor()

	move_and_slide()
	
	if (was_on_floor && !is_on_floor()):
		coyote_timer.start()
