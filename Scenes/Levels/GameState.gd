extends Node2D

var lives = 3;
var coins = 0;

const DAMAGE = 1;
const COINS_NEEDED_TO_GET_A_LIFE = 3;

func _ready():
	add_to_group("Gamestate");
	get_tree().call_group("GUI", "update_lives", lives);
	get_tree().call_group("GUI", "update_coins", coins);

func hurt():
	lives -= DAMAGE;
	$Player.hurt();
	get_tree().call_group("GUI", "update_lives", lives);

	if lives == 0:
		end_game();

func add_coin():
	coins += 1;
	var should_get_a_life = (coins % COINS_NEEDED_TO_GET_A_LIFE) == 0;

	if should_get_a_life:
		lives += 1;
		get_tree().call_group("GUI", "update_lives", lives);
		
	get_tree().call_group("GUI", "update_coins", coins);

func end_game():
	get_tree().change_scene("res://Scenes/Levels/GameOver.tscn");
