extends CanvasLayer

onready var LifeCounter = $Control/TextureRect/HBoxContainer/LifeCounter;
onready var CoinCounter = $Control/TextureRect/HBoxContainer/CoinCounter;

func update_lives(lives):
	LifeCounter.text = str(lives);

func update_coins(coins):
	CoinCounter.text = str(coins);
