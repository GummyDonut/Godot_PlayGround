extends RigidBody2D

@export var min_speed = 150.0
@export var max_speed = 250.0


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play()
	
	# we grab the sprite frames here to represent the different enemies
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.animation = mob_types[randi_range(0, mob_types.size() - 1)]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
