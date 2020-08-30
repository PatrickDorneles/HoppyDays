extends KinematicBody2D

var motion = Vector2(0,0);

const SPEED = 1000;
const GRAVITY = 100;
const UP = Vector2(0, -1);
const JUMP_SPEED = 2000;
const WORLD_LIMIT = 4000;
const BOOST_MULTIPLIER = 1.5;

signal animate;

func _physics_process(delta):
	apply_gravity();
	jump();
	move();
	animate()
	move_and_slide(motion, UP);

func apply_gravity():
	if position.y > WORLD_LIMIT:
		get_tree().call_group("Gamestate", "end_game");

	if is_on_ceiling():
		motion.y = 1;
		return

	if not is_on_floor():
		motion.y += GRAVITY;
		return
	

	motion.y = 0;

func animate():
	emit_signal("animate", motion);
	
func jump():
	if Input.is_action_pressed("jump") and is_on_floor(): 
		motion.y -= JUMP_SPEED;
		$PlayerSFXs/JumpSFX.stream = load("res://Resources/SFX/jump1.ogg");
		$PlayerSFXs/JumpSFX.stream.loop = false;
		$PlayerSFXs/JumpSFX.play()

func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -SPEED;
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = SPEED;
	else:
		motion.x = 0;


func hurt():
	$PlayerSFXs/PainSFX.stream = load("res://Resources/SFX/pain.ogg");
	$PlayerSFXs/PainSFX.stream.loop = false;
	$PlayerSFXs/PainSFX.play();

	position.y -= 1;
	yield(get_tree(), "idle_frame");
	motion.y -= JUMP_SPEED;

func boost():
	position.y -= 1;
	yield(get_tree(), "idle_frame");
	motion.y -= JUMP_SPEED * BOOST_MULTIPLIER;
