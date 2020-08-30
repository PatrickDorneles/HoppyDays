extends Node2D

var lives = 3;

const DAMAGE = 1;

func _ready():
	add_to_group("Gamestate");
	get_tree().call_group("GUI", "update_lives", lives);

func hurt():
	lives -= DAMAGE;
	$Player.hurt();
	get_tree().call_group("GUI", "update_lives", lives);

	if lives == 0:
		end_game();


func end_game():
	get_tree().change_scene("res://Scenes/Levels/GameOver.tscn");
