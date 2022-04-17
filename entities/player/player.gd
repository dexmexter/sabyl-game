extends KinematicBody2D

# Movement speed in pixels per second.
export var speed = 75

var _velocity = Vector2.ZERO


func _physics_process(_delta) -> void:
	var direction = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	if direction.length() > 1.0:
		direction = direction.normalized()
	move_and_slide(speed * direction)
