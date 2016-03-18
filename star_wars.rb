require 'gosu'

class GameWindow < Gosu::Window
	def initialize
		super(800, 1000, false)
		self.caption = 'Star Wars Game'

		#images
		@background = Gosu::Image.new(self, 'art/starry_background.png')
		@title = Gosu::Image.new(self, 'art/sw_title.png')


		#sounds
		@song = Gosu::Song.new(self, 'sound/sw_theme.mp3')
		@song.volume = 0.6
		@song.play
	end

	def needs_cursor?
		true
	end

	def button_down id
		close if id == Gosu::KbEscape
	end

	def update
		@x = self.width/2 - @title.width/2
		@y = 40
		@z = 1
	end

	def draw
		@title.draw @x, @y, @z
		@background.draw(0,0,0,1,1.5)
	end
end

GameWindow.new.show