extends Polygon2D

var shard_velocity_map = {}


func _ready():
	randomize()

func explode():
	var points = polygon
	
	#now let's add some extra points
	for i in range(16):
		points.append(Vector2(randi()%128, randi()%128))
	
	var delaunay_points = Geometry.triangulate_delaunay_2d(points)
	print(delaunay_points)
	
	# we will generate 3 points per created triangle
	for index in len(delaunay_points) / 3:
		var shard_pool = PoolVector2Array()
		var center = Vector2.ZERO
		for n in range(3):
			shard_pool.append(points[delaunay_points[(index * 3) + n]])
			center += points[delaunay_points[(index * 3) + n]]
		
		#this will get the mean position of our points
		center /= 3
		
		
		var polygon_shard = Polygon2D.new()
		
		#this is currently from the top left, we wan't it to be from the center of our polygon
		# we can figure it out using the mean of our vertices but for this sprite we know it is 64, 64
		
		print(center - Vector2(64,64))
		shard_velocity_map[polygon_shard] = Vector2(64,64) - center
		
		polygon_shard.polygon = shard_pool
		polygon_shard.color = Color(randf(), randf(), randf(), 1)
#		polygon_shard.texture = texture
		add_child(polygon_shard)
	
	color.a = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for child in shard_velocity_map.keys():
		child.position -= shard_velocity_map[child] * delta * 20
		#let's apply some simple rotation
		child.rotation -= shard_velocity_map[child].x * delta * 0.1
		# apply some gravity for fun
		shard_velocity_map[child].y -= delta * 35
		
func _input(event):
	if Input.get_action_strength("ui_accept"):
		explode()
