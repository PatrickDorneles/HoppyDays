extends AnimatedSprite

func _on_Player_animate(motion: Vector2):
	if motion.y < 0:
		play("jump");
	elif motion.x > 0:
		flip_h = false;
		play("walk");
	elif motion.x < 0:
		flip_h = true;
		play("walk");
	else:
		play("idle");

