class XwingLaser

	def initialize(x,y)
		@x = x
		@y = y
		@z = 1
		sound.play

		@laser = Gosu::Image.new(
							 $window,
							 'art/xwing_laser.png'
						 )
		@laser_speed = 60
	end

	def fire(speed)
		@speed = speed
		@fired_at = Gosu.milliseconds
	end

	def update
		@y += -@laser_speed
		# fly_distance = (Gosu.milliseconds - @fired_at) * 0.001 * @speed
	end

	def draw
		# left laser
		@laser.draw(@x-3,@y+30,@z,0.5,0.5)
		# right laser
		@laser.draw(@x+79,@y+30,@z,0.5,0.5)
	end


	private

	def sound
		@@sound = Gosu::Sample.new(
								$window,
								'sound/xwing_laser.wav'
							)
	end

end