class Xwing

	attr_accessor :xwing_laser, :score, :x, :y, :z
	SHOOT_DELAY = 250

	def initialize
		@xwing_image = Gosu::Image.new($window, 'art/xwing.png')
		@x = $window.width/2 - @xwing_image.width/2
		@y = $window.height - 200
		@z = 1
		@last_shot = 0
		@alive = true
		@score = 0
	end

	def update
		@x += -10 if $window.button_down? Gosu::KbA
		@x += +10 if $window.button_down? Gosu::KbD
		@y += -8 if $window.button_down? Gosu::KbW
		@y += +8 if $window.button_down? Gosu::KbS
		if $window.button_down?(Gosu::KbL)
			shoot
		end
		if @xwing_laser
			@xwing_laser.update
		end

	end

	def draw
		@xwing_image.draw(@x,@y,@z,0.6,0.6)
		if @xwing_laser
			@xwing_laser.draw
		end
	end

	def shoot
		if Gosu.milliseconds - @last_shot > SHOOT_DELAY
			@last_shot = Gosu.milliseconds
			@xwing_laser = XwingLaser.new(@x,@y)
		end
	end

	def hitbox
		hitbox_x = ((@x - 35).to_i..(@x + 35).to_i).to_a
		hitbox_y = ((@y - 35).to_i..(@y + 35).to_i).to_a
		{x: hitbox_x, y: hitbox_y}
	end

	def kill
		GameState.switch(MenuState.instance)
	end

end