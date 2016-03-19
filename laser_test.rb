require 'gosu'

	class LaserTest < Gosu::Window
		def initialize
			super(800,1000,false)
			@x = 300
			@y = 800
			# @z = 1

			@laser = Gosu::Image.new(
								 self,
								 'art/xwing_laser.png'
							 )
			@speed = 7
		end

		def update
			@y += -@speed
		end

		def draw
			@laser.draw(@x,@y,0)
		end
	end

	LaserTest.new.show