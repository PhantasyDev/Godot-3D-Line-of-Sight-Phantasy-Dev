extends Spatial


export var lookSens = 8
var minLookAngle = -75
var maxLookAngle = 75
var mouseDelta = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event):
	if event is InputEventMouseMotion:
		mouseDelta = event.relative

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var rot = Vector3(mouseDelta.y, mouseDelta.x, 0) * lookSens * delta
	
	rotation_degrees.x -= rot.x
	rotation_degrees.x = clamp(rotation_degrees.x, minLookAngle, maxLookAngle)
	
	get_parent().rotation_degrees.y -= rot.y
	mouseDelta = Vector2()
