extends AnimatedSprite3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event.is_action_just_pressed("activate"):
		play("Triple Attack",2)
	if event.is_action_just_pressed("ui_accept"):
		play("Jump")
	if event.is_action_pressed("left"):
		$".".flip_h = true
		play("Run",2)
	if event.is_action_released("left"):
		play("Idle",2)
	if event.is_action_pressed("right"):
		$".".flip_h = false
		play("Run",2)
	if event.is_action_released("right"):
		play("Idle",2)
	
	if $AnimatedSprite3D.animation_finished():
		play("Idle", 2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_animation_finished() -> void:
	play("Idle",2)
