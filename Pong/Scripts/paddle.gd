extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const ball_scene = preload("res://MiniScenes/Ball.xml")
#Esto es para ejecutar una funcion de fixed update! cada physic tick.
func _ready():
	set_fixed_process(true);
	set_process_input(true);

#Consigue las posiciones X y Y en vectores para ejecutar una posicion
#tal como en Unity!
func _fixed_process(delta):
	var y = get_pos().y
	var mouse_x = get_viewport().get_mouse_pos().x
	set_pos(Vector2(mouse_x,y));
	

func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON && event.is_pressed():
		print("Funciona?")
		
		var ballcount = get_tree().get_nodes_in_group("Ball").size();
		if ballcount<=0:
			var ball = ball_scene.instance()
			ball.set_pos(get_pos()-Vector2(0,16))
			get_tree().get_root().add_child(ball)
		
		