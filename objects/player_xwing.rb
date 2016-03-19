class PlayerXwing

	attr_accessor :x, :y
	SHOOT_DELAY = 250

	def initialize
		@player_image = Gosu::Image.new($window, 'art/player_crop.png')
		@x = $window.width/2 - @player_image.width/2
		@y = $window.height - 200
		@z = 1
		@last_shot = 0
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
		@player_image.draw(@x,@y,@z,0.6,0.6)
		if @laser
			@laser.draw
		end
	end

	def shoot
		if Gosu.milliseconds - @last_shot > SHOOT_DELAY
			@last_shot = Gosu.milliseconds
			# XwingLaser.new(@x,@y).fire(100)
			@laser = XwingLaser.new(@x,@y)
		end
	end

end