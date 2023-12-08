extends CharacterBody2D

var speed := 250
@onready var animated_sprite_2d = $AnimatedSprite2D
signal scoreUp
signal playerDied

func _physics_process(delta):
	var right_left = Input.get_axis("ui_left", "ui_right")
	
	var jump = Input.get_action_strength("ui_up")
	
	velocity.x = right_left * speed
	
	if jump != 0 and is_on_floor():
		velocity.y = 0
		velocity.y -= jump * 300
	
	if !is_on_floor():
		velocity.y += 15
	
	move_and_slide()
	
	if velocity.x != 0:
		animated_sprite_2d.play("caminar")
		animated_sprite_2d.flip_h = right_left>0
	else:
		animated_sprite_2d.play("quieto")

func subirScore():
	emit_signal("scoreUp")
	
func muerte():
	emit_signal("playerDied")
