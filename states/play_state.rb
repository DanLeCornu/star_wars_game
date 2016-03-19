require_relative '../objects/player_xwing'
# require_relative '../objects/xwing_laser'

class PlayState < GameState

	def initialize
		@player_xwing = PlayerXwing.new

		#images
		@background = Gosu::Image.new(
										$window,
										'art/starry_background.png'
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
		@@music = Gosu::Song.new(
									$window,
									'sound/battle_of_yavin.mp3'
								)
	end

	def update
		$window.caption = 'Star Wars Game ' << "[FPS: #{Gosu.fps}]"
		@player_xwing.update
	end

	def draw
		@player_xwing.draw
		@background.draw(0,0,0,1,1.5)
	end

	def button_down(id)
		if id == Gosu::KbEscape || id == Gosu::KbQ
			GameState.switch(MenuState.instance)
		end
		# replaced, not needed, probs delete this
		# @player_xwing.button_down(id)
	end

end