extends Node2D

var isPressed = false
var lastPos = Vector2.ZERO
var lastScl = Vector2.ZERO
onready var this3DCard = get_node("3DCardViewport/3DCardScene/H")
onready var this2DCard = get_node("2D3DCard")

func _ready():
	set_process_unhandled_input(true)


func _unhandled_input(event):
	if event is InputEventMouseButton:
		isPressed = event.is_pressed()

		if isPressed:
			lastPos = event.position

			match event.button_index:
				BUTTON_WHEEL_UP:
					this2DCard.scale.x += 0.1
					this2DCard.scale.y += 0.1
				BUTTON_WHEEL_DOWN:
					this2DCard.scale.x -= 0.1
					this2DCard.scale.y -= 0.1


	elif event is InputEventMouseMotion:
		if isPressed:
			var delta = event.position - lastPos
			lastPos = event.position
			this3DCard.rotate_x(-delta.y * 0.004)
			this3DCard.rotate_y(delta.x * 0.004)
