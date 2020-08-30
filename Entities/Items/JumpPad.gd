extends Area2D

func _on_JumpPad_body_entered(body):
	if body.has_method("boost"):
		$AnimationPlayer.play("boost");
		body.boost();

func end_game():
	get_tree().change_scene("res://Scenes/Levels/GameOver.tscn");
