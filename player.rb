require 'gosu'

class Player
	def initialize(window)
		@window = window
		@image = Gosu::Image.new(@window, 'art/player_crop.png')
		@x = @window.width/2 - @image.width/2
		@y = @window.height - 200
	end

	def button_down id
	end

	def update
		@x += -5 if @window.button_down? Gosu::KbLeft
		@x += +5 if @window.button_down? Gosu::KbRight
		@y += -5 if @window.button_down? Gosu::KbUp
		@y += +5 if @window.button_down? Gosu::KbDown
	end

	def draw
		@image.draw @x, @y, 0
	end
end

class PlayerGame < Gosu::Window
	def initialize
		super(800, 1000, false)
		self.caption = 'player movement'
		@player = Player.new self
		@background = Gosu::Image.new(self, 'art/starry_background.png')
		@player_shoot = Gosu::Sample.new(self, 'sound/tie_fighter_shot.mp3')
	end

	def button_down id
		close if id == Gosu::KbEscape

		if id == Gosu::KbSpace
			@player_shoot.play(volume = 0.2)
		end

	end

	def needs_cursor?
		true
	end

	def update
		@player.update
	end

	def draw
		@background.draw 0,0,0,1,1.5
		@player.draw
	end

end

PlayerGame.new.show


