extends Polygon2D

var gen_texture

func _ready():
	var max_x = 0
	var max_y = 0
	for point in polygon:
		if point.x > max_x: max_x = point.x
		if point.y > max_y: max_y = point.y
	var dat = []
	
	for y in range(max_y):
		for x in range(max_x):
			if Geometry.is_point_in_polygon(Vector2(x, y), polygon):
				dat.append(255)
			else:
				dat.append(0)
	gen_texture = create_im(max_x, max_y, dat)
	$Node2D.set_bound(gen_texture, max_x, max_y, global_position)
	print(max_y)

func create_im(x,y, data):
	var img = Image.new()
	img.create_from_data(x, y, false, Image.FORMAT_L8, PoolByteArray(data))
	var tex = ImageTexture.new()
	print(img)
	tex.create_from_image(img, 16)
	return tex
