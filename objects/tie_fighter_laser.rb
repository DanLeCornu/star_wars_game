class TieFighterLaser

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
		@laser_speed = 50
		@distance_traveled, @max_distance = 0, 50
	end

	def update
		@y += +@laser_speed
		@distance_traveled += 1
		kill if @distance_traveled > @max_distance
	end

	def draw
		# left laser
		@laser_image.draw(@x,@y,@z,0.5,0.5)
		# right laser
		@laser_image.draw(@x,@y,@z,0.5,0.5)
	end


	def hitbox
	  hitbox_x = ((@x - @laser_image.width/2).to_i..(@x + @laser_image.width/2.to_i)).to_a
	  hitbox_y = ((@y - @laser_image.width/2).to_i..(@y + @laser_image.width/2).to_i).to_a
	  {x: hitbox_x, y: hitbox_y}
	end

	def kill
	  @alive = false
	end

	def dead?
	  !@alive
	end


	private

	def sound
		@@sound = Gosu::Sample.new(
								$window,
								'sound/tie_laser.mp3'
							)
	end

end