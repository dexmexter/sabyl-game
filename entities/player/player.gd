extends KinematicBody2D

# Movement speed in pixels per second.
export var speed = 75

var _velocity = Vector2.ZERO
var new_dialog = Dialogic.start("BillIntroduction")


func _physics_process(_delta) -> void:
	var direction = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	
	if Input.is_action_just_pressed("ui_accept"):
		add_child(new_dialog)
	
	if direction.length() > 1.0:
		direction = direction.normalized()
		
	move_and_slide(speed * direction)
