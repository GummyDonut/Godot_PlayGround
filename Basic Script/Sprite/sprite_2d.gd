extends Sprite2D

signal timer_update(new_value)

# Properties for the sprite
var angular_speed = PI # this is 3.14
var speed = 400
# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = get_node("Timer") # the path here is relative, especially the child name
	timer.timeout.connect(_on_timer_timeout) #the signal name is the first property of timer, and connect is the method
	# to the function to the signal


# Called every frame. 'delta' is the elapsed time since the previous frame.
# delta is the time between two frames
func _process(delta):
	
	rotation += angular_speed * delta # rotation are in radians
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta
	
	# Code below for manually controllling ---------------------------
	#var direction = 0
	## if we press the left arrow key
	#if Input.is_action_pressed("ui_left"):
		#direction = -1
	#if Input.is_action_pressed("ui_right"):
		#direction = 1
	#
	#rotation += angular_speed * direction * delta # rotation are in radians
	#
	## code for moving forwards or backwards
	#var accelerate = 0
	#if Input.is_action_pressed("ui_up"):
		#accelerate = 1   # velocity is direction + speed
	#elif Input.is_action_pressed("ui_down"):
		#accelerate = -1
		#
	#var velocity = Vector2.UP.rotated(rotation) * speed * accelerate
	#
	#position += velocity * delta
	
func _on_button_pressed():
	# stops or starts the game loop for this node.
	set_process(not is_processing())
	
	
func _on_timer_timeout():
	visible = not visible
	emit_signal('timer_update', 'red')
