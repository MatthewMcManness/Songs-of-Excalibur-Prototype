extends CharacterBody3D

const SPEED = 1.0
const GRAVITY = Vector3(0, -9.8, 0)  # define your own gravity

func _physics_process(delta: float) -> void:
	# Gravity
	if not is_on_floor():
		velocity += GRAVITY * delta

	# Correct path to the player (since both are children of "Game")
	var player = get_node("/root/Game/Unit")
	print("Player node is:", player)

	if player:
		var direction = player.global_transform.origin - global_transform.origin
		direction.y = 0
		direction = direction.normalized()
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		print("Moving towards player. Direction =", direction)
	else:
		# Idle
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
