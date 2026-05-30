extends AnimatedSprite2D

var shad = material as ShaderMaterial

@export var firstColor : Array[Color]
@export var secondColor : Array[Color]

var currentWeapon := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play("idle")
	newColor()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func newColor():
	shad.set_shader_parameter("NewBlue", firstColor[currentWeapon])
	shad.set_shader_parameter("NewLBlue", secondColor[currentWeapon])


func _on_button_left_pressed() -> void:
	if currentWeapon >= 1:
		currentWeapon -= 1
	else:
		currentWeapon = 5
		
	newColor() 


func _on_button_right_pressed() -> void:
	if currentWeapon <= 4:
		currentWeapon += 1
	else:
		currentWeapon = 0
	
	newColor() 
