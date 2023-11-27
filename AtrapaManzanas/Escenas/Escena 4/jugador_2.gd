extends CharacterBody2D

var speed := 250
@onready var animated_sprite_2d = $AnimatedSprite2D
signal scoreUp
signal playerDied

func _ready():
	pass
	
func _process(delta):
	pass

func _input(event):
	pass
	
func _init():
	pass
	
func _physics_process(delta):
	var right_left = Input.get_axis("ui_left", "ui_right")
	
	velocity.x = right_left * speed
	
	move_and_slide()
	
	if velocity.x != 0:
		animated_sprite_2d.play("caminar")
		animated_sprite_2d.flip_h = right_left>0
	else:
		animated_sprite_2d.play("caminar")

func subirScore():
	emit_signal("scoreUp")
	
func muerte():
	emit_signal("playerDied")
