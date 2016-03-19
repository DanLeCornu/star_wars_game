class PlayerXwing

	def initialize
		@player = Gosu::Image.new($window, 'art/player_crop.png')
		@x = $window.width/2 - @player.width/2
		@y = $window.height - 200

		# sound (commented out beacause XwingLaser class
		# will handle the sound of the laser)
		# @shoot = Gosu::Sample.new(
		# 						$window,
		# 						'sound/xwing_laser.wav'
		# 					)
	end

	def update
		@x += -10 if $window.button_down? Gosu::KbA
		@x += +10 if $window.button_down? Gosu::KbD
		@y += -8 if $window.button_down? Gosu::KbW
		@y += +8 if $window.button_down? Gosu::KbS
		if $window.button_down?(Gosu::KbL)
			shoot
		end
	end

	def draw
		@player.draw(@x,@y,1)
	end

	# commented below method out for now, as
	# code in update fires the shoot method instead
	# def button_down(id)
	# 	if id == Gosu::KbL
	# 		@shoot.play(volume = 0.8)
	# 	end
	# end

	def shoot
		Laser.new(@x,@y).fire(100)
	end

end