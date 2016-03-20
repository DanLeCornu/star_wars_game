class Xwing

	SHOOT_DELAY = 250

	def initialize
		@xwing_image = Gosu::Image.new($window, 'art/xwing.png')
		@x = $window.width/2 - @xwing_image.width/2
		@y = $window.height - 200
		@z = 1
		@last_shot = 0
		@alive = true
		@lives = 3
	end

	def update
		@x += -10 if $window.button_down? Gosu::KbA
		@x += +10 if $window.button_down? Gosu::KbD
		@y += -8 if $window.button_down? Gosu::KbW
		@y += +8 if $window.button_down? Gosu::KbS
		if $window.button_down?(Gosu::KbL)
			shoot
		end
		if @laser
			@laser.update
		end
	end

	def draw
		@xwing_image.draw(@x,@y,@z,0.6,0.6)
		if @laser
			@laser.draw
		end
	end

	def shoot
		if Gosu.milliseconds - @last_shot > SHOOT_DELAY
			@last_shot = Gosu.milliseconds
			@laser = XwingLaser.new(@x,@y)
		end
	end

	def hitbox
		hitbox_x = ((@x - @xwing_image.width/2).to_i..(@x + @xwing_image.width/2.to_i)).to_a
		hitbox_y = ((@y - @xwing_image.width/2).to_i..(@y + @xwing_image.width/2).to_i).to_a
		{x: hitbox_x, y: hitbox_y}
	end

	def kill
		@lives -= 1
		alive = false
		return if lives <= 0
		warp
	end

	def warp
		@x = $window.width/2 - @xwing_image.width/2
		@y = $window.height - 200
		@alive = true
	end

	def dead?
		!@alive
	end

end