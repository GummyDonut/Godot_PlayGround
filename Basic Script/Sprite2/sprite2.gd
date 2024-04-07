extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_sprite_2d_timer_update(new_value):
	var gradientTexture2D := texture as GradientTexture2D
	gradientTexture2D.set_fill(1)
	set_texture(gradientTexture2D)
