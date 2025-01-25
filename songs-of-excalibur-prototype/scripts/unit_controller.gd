extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Unit Initiated")
	$"../AnimatedSprite3D".animation = "idle"

func _input(event: InputEvent) -> void:
		if event.is_action_pressed("activate"):
			$"../AnimatedSprite3D".animation = "Triple Attack"
		if event.is_action_pressed("left"):
			$"../AnimatedSprite3D".animation = "Run"
		if event.is_action_pressed("up"):
			$"../AnimatedSprite3D".animation = "idle"

			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
