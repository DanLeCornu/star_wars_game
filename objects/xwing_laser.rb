class XwingLaser

	COLOR = Gosu::Color::RED

	def initialize(x,y)
		@x = x
		@y = y
		@z = 1
		# @beam = Gosu::Image.new(
		# 					$window,
		# 					'art/xwing_laser.png'
		# 				)
		sound.play
	end

	def draw
		# @beam.draw(@x,@y,@z)
		$window.draw_quad(
			@x, @y, COLOR,
      @x + 5, @y, COLOR,
      @x + 5, @y + 50, COLOR,
      @x, @y + 50, COLOR,
      1
    )
	end

	def update
		fly_distance = (Gosu.milliseconds - @fired_at) * 0.001 * @speed
	end

	def fire(speed)
		@speed = speed
		@fired_at = Gosu.milliseconds
		self
	end

	private

	def sound
		@@sound = Gosu::Sample.new(
								$window,
								'sound/xwing_laser.wav'
							)
	end

end