extends CharacterBody2D


const SPEED = 140.0
const JUMP_VELOCITY = -300.0
var polarity
@onready var timer = $Timer

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func move(direction):
	if (direction == "right"):
		direction = 1
		velocity.x = direction * SPEED
	elif (direction == "left"):
		direction = -1
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

func setPolar(x):
	polarity = x
	
func _ready():
	setPolar("right")
		
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and (is_on_floor() || !timer.is_stopped()):
		velocity.y = JUMP_VELOCITY
	move(polarity)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var was_on_floor = is_on_floor()

	move_and_slide()
	
	if (was_on_floor && !is_on_floor()):
		timer.start()
