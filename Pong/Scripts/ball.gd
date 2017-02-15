extends RigidBody2D

const MAXS_PEED = 300
const SPEED_UP = 4

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.is_in_group("Bricks"):
			body.queue_free()
			
		if body.get_name() == "Paddle":
			var speed = get_linear_velocity().length()
			var direction = get_pos() - body.get_node("Anchor").get_global_pos()
			var velocity = direction.normalized()*min(speed+SPEED_UP,MAXS_PEED)
			set_linear_velocity(velocity)
			
	if get_pos().y > get_viewport_rect().end.y:
		queue_free()
		print("Ded.")
		
