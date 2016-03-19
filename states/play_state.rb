require_relative '../objects/player_xwing'

class PlayState < GameState

	def initiialize
		@player_xwing = PlayerXwing.new
	end

	def update
		$window.caption = 'Star Wars Game ' << "[FPS: #{Gosu.fps}]"
	end

	def draw
		@player_xwing.draw
	end

	def button_down(id)
		if id == Gosu::KbQ || Gosu::KbEscape
			GameState.switch(MenuState.instance)
		end
	end

end