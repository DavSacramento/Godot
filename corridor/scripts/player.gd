extends CharacterBody2D

const SPEED = 100.0

# Reference to the character's sprite node (adjust the name if it is not exactly Sprite2D)
@onready var sprite: Sprite2D = $Sprite2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Get input direction
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if input_dir != Vector2.ZERO:
		# Adds velocity to input vector
		velocity = input_dir * SPEED
		
		# Flip the sprite horizontally based on movement direction
		if input_dir.x > 0:
			animated_sprite.flip_h = false # Facing right
		elif input_dir.x < 0:
			animated_sprite.flip_h = true  # Facing left
	else:
		# Deccelerates to 0 if no input movement
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
