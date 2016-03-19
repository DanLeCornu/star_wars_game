class PlayerXwing

	def initialize
		@player = Gosu::Image.new($window, 'art/player_crop.png')
		@x = $window.width/2 - @player.width/2
		@y = $window.height - 200
		@z = 1
		# sound.volume = 0.5
	end

	def sound
		@@fly ||= Gosu::Song.new(
									$window,
									'sound/xwing_fly.wav'
								)
		@@shoot = Gosu::Sample.new(
								$window,
								'sound/tie_fighter_shot.mp3'
							)

	end

	def update
		@x += -5 if @window.button_down? Gosu::KbA
		@x += +5 if @window.button_down? Gosu::KbD
		@y += -5 if @window.button_down? Gosu::KbW
		@y += +5 if @window.button_down? Gosu::KbS

		# if moving?
		# 	fly.play(true)
		# else
		# 	fly.pause
		# end
	end

	# def moving?
	# 	any_button_down?(
	# 		Gosu::KbW,
	# 		Gosu::KbA,
	# 		Gosu::KbS,
	# 		Gosu::KbD
	# 	)
	# end

	def draw
		@player.draw(@x,@y,@z)
	end

	def button_down id
		if id == Gosu::KbL
			@player_shoot.play(volume = 0.2)
		end
	end

	private

	# def any_button_down?(*buttons)
	#   buttons.each do |b|
	#     return true if $window.button_down?(b)
	#   end
	#   false
	# end

end