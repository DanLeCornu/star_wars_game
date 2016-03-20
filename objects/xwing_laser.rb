class XwingLaser

	def initialize(x,y)
		@x = x
		@y = y
		@z = 1
		sound.play

		@laser_image = Gosu::Image.new(
							 $window,
							 'art/xwing_laser.png'
						 )
		@alive = true
		@laser_speed = 60
		@distance_traveled, @max_distance = 0, 50
	end

	def update
		@y += -@laser_speed
		@distance_traveled += 1
		kill if @distance_traveled > @max_distance
	end

	def draw
		# left laser
		@laser_image.draw(@x-3,@y+30,@z,0.4,0.4)
		# right laser
		@laser_image.draw(@x+79,@y+30,@z,0.4,0.4)
	end

	def hitbox
		hitbox_x = ((@x - 5).to_i..(@x + 5).to_i).to_a
		hitbox_y = ((@y - 5).to_i..(@y + 5).to_i).to_a
		{x: hitbox_x, y: hitbox_y}
	end

	def kill
	  @alive = false
	end

	private

	def sound
		@@sound = Gosu::Sample.new(
								$window,
								'sound/xwing_laser.wav'
							)
	end

end