require_relative '../objects/xwing'
require_relative '../objects/xwing_laser'
require_relative '../objects/tie_fighter'
require_relative '../objects/tie_fighter_laser'

# attr_accessor :time_since_last_tie_fighter

class PlayState < GameState

	def initialize
		@xwing = Xwing.new

		@start_time = Time.now

		@background_image = Gosu::Image.new($window,'art/starry_background.png')
	end


	def enter
		music.play
		music.volume = 0.7
	end

	def leave
		music.volume = 0
		music.stop
	end

	def music
		@@music ||= Gosu::Song.new($window,'sound/battle_of_yavin.mp3')
	end

	def update
		$window.caption = 'Star Wars Game ' << "[FPS: #{Gosu.fps}]"
		@xwing.update

		# if the current time is greater than the init time, add time to the start time and spawn a new tie fighter
		if Time.now > @start_time
			@start_time += +rand(2.0..4.0)
			@tie_fighter = TieFighter.new
		end

		@tie_fighter.update
	end

	def draw
		@background_image.draw(0,0,0,1,1.5)
		@xwing.draw
		@tie_fighter.draw
	end

	def button_down(id)
		if id == Gosu::KbEscape || id == Gosu::KbQ
			GameState.switch(MenuState.instance)
		end
	end

end