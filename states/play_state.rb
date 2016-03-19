require_relative '../objects/player_xwing'

class PlayState < GameState

	def initialize
		@player_xwing = PlayerXwing.new

		#images
		@background = Gosu::Image.new(
										$window,
										'art/starry_background.png'
									)
	end

	def update
		$window.caption = 'Star Wars Game ' << "[FPS: #{Gosu.fps}]"
	end

	def draw
		@player_xwing.draw
		@background.draw(0,0,0,1,1.5)
	end

	def button_down(id)
		if id == Gosu::KbQ || Gosu::KbEscape
			GameState.switch(MenuState.instance)
		end
	end

end