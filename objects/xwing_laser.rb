class XwingLaser

	def initialize(source_x, source_y)
		@x = source_x
		@y = source_y
		sound.play
	end

	def update
	end

	def draw

	end

	def fire(speed)
		@speed = speed
		@fired_at = Gosu.milliseconds
	end

	private

	def sound
		@@sound = Gosu::Sample.new(
								$window,
								'sound/xwing_laser.wav'
							)
	end

end