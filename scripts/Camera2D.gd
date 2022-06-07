extends Camera2D

var timer: float

func _process(delta):
	
	# camera seta opcao offset (1 - (-1)) de acordo com a posição do mouse
	# offset y tem menor mobilidade
	offset_h = get_local_mouse_position().x/640
	offset_v = get_local_mouse_position().y/486 - .4
	
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	# temporizador para aumentar a velocidade da suavização da camera quando o jogador está caindo
	# em alta velocidade; temporizador incrementa com valor de delta
	if abs(get_parent().velocity.y) <= 100: timer = delta
	else: timer += delta
	
	smoothing_speed = 7 + timer*3
	
	if smoothing_speed >= 13:
		smoothing_speed = 13

func _on_MapAreaCollider_area_entered(area):
	get_parent().get_node("Bg/Orange").visible = area.get_parent().is_in_group("Surface")
	get_parent().get_node("Bg/Purple").visible = area.get_parent().is_in_group("AreaE")
	get_parent().get_node("Bg/Red").visible = area.get_parent().is_in_group("Area0")
	get_parent().get_node("Bg/Blue").visible = area.get_parent().is_in_group("Area1")
	get_parent().get_node("Bg/Green").visible = area.get_parent().is_in_group("Area2")
	
	var collision_shape = area.get_node("CollisionShape2D")
	var size = collision_shape.shape.extents*2
	
	var view_size = get_viewport_rect().size * zoom
	if size.y+128 < view_size.y:
		size.y = view_size.y-128
	if size.x+128 < view_size.x:
		size.x = view_size.x-128

	limit_top = (collision_shape.global_position.y - size.y/2) - 64
	limit_left = (collision_shape.global_position.x - size.x/2) - 64

	limit_bottom = (limit_top + size.y) + 128
	limit_right = (limit_left + size.x) + 128
