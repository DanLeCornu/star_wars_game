require 'singleton'

class MenuState < GameState
	include Singleton
	attr_accessor :play_state

	def initialize
		$window.caption = 'Star Wars Game'

		#images
		@background = Gosu::Image.new(
										$window,
										'art/starry_background.png'
									)
		@title = Gosu::Image.new(
						 	$window,
						 	'art/sw_title.png'
						 )

		# menu options
		continue_text = @play_state ? 'Press C to Continue,' : ''
		@menu_options = Gosu::Image.from_text(
											$window,
											"Press Q to Quit, #{continue_text} Press N to start a New Game",
											Gosu.default_font_name,
											30
										)
	end

	def enter
		music.play
		music.volume = 0.6
	end

	def leave
		music.volume = 0
		music.stop
	end

	def music
		@@music ||= Gosu::Song.new(
									$window,
									'sound/sw_theme.mp3'
								)
	end

	# button inputs
	def button_down(id)

		$window.close if id == Gosu::KbEscape
		$window.close if id == Gosu::KbQ

		# if C is pressed and playstate is active, continue game
		if id == Gosu::KbC && @play_state
			GameState.switch(@play_state)
		end

		# if N is pressed, new game
		if id == Gosu::KbN
			@play_state = PlayState.new
			GameState.switch(@play_state)
		end

	end

	def update

		# position for title
		@title_x = $window.width/2 - @title.width/2
		@title_y = $window.height/2 - @title.height/2 - 50
		@title_z = 1

		# position for background
		@background_x = 0
		@background_y = 0
		@background_z = 0
		@background_fx = 1
		@background_fy = 1.5

		# position for menu options
		@menu_options_x = $window.width/2 - @menu_options.width/2
		@menu_options_y = $window.height/2 - @menu_options.height/2 + 50
		@menu_options_z = 1

	end

	def draw
		@title.draw(
						@title_x,
						@title_y,
						@title_z
					)

		@background.draw(
									@background_x,
									@background_y,
									@background_z,
									@background_fx,
									@background_fy
								)

		@menu_options.draw(
										@menu_options_x,
										@menu_options_y,
										@menu_options_z
									)
	end

end

