class XwingLaser

	attr_accessor :x, :y
	COLOR = Gosu::Color::RED

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
		@y = @y + 20
		@y += -@laser_speed
		# fly_distance = (Gosu.milliseconds - @fired_at) * 0.001 * @speed
	end

	def draw
		@laser.draw(@x,@y,@z,0.5,0.5)

		# #drawing left laser
		# $window.draw_quad(
		# 	@x + 9, @y, COLOR,
  #     @x + 14, @y, COLOR,
  #     @x + 14, @y + 50, COLOR,
  #     @x + 9, @y + 50, COLOR,
  #     1
  #   )
		# # drawing right laser
		# $window.draw_quad(
		# 	@x + 144, @y, COLOR,
  #     @x + 149, @y, COLOR,
  #     @x + 149, @y + 50, COLOR,
  #     @x + 144, @y + 50, COLOR,
  #     1
  #   )
	end


	private

	def sound
		@@sound = Gosu::Sample.new(
								$window,
								'sound/xwing_laser.wav'
							)
	end

end