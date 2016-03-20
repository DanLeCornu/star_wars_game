include Math

require_relative '../objects/xwing'
require_relative '../objects/xwing_laser'
require_relative '../objects/tie_fighter'
require_relative '../objects/tie_fighter_laser'
require_relative '../objects/explosion'

class PlayState < GameState

	def initialize
		@xwing = Xwing.new
		@start_time = Time.now
		@background_image = Gosu::Image.new($window,'art/starry_background.png')
		@animation = Explosion.load_animation($window)
		@explosions = []
	end


	def enter
		music.play
		music.volume = 0.8
	end

	def leave
		music.volume = 0
		music.stop
	end

	def music
		@@music ||= Gosu::Song.new($window,'sound/battle_of_yavin.mp3')
	end

	def explosion
		@@explosion = Gosu::Sample.new($window,"sound/explosion_#{rand(1..4)}.mp3")
	end

	def update
		$window.caption = 'Star Wars Game ' << "[FPS: #{Gosu.fps}]"
		@xwing.update

		# if the current time is greater than the init time, add time to the start time and spawn a new tie fighter
		if Time.now > @start_time
			@start_time += +rand(1.0..3.0)
			@tie_fighter = TieFighter.new
		end

		@tie_fighter.update

		unless @tie_fighter.dead?
			detect_collisions
		end

		@score_text = Gosu::Image.from_text($window, "Score: #{@xwing.score}",Gosu.default_font_name,30)

		@explosions.reject!(&:done?)
		@explosions.map(&:update)

	end

	def draw
		@background_image.draw(0,0,0,1,1.6)
		@xwing.draw
		@tie_fighter.draw
		@score_text.draw(0,0,1)
		@explosions.map(&:draw)
	end

	def button_down(id)
		if id == Gosu::KbEscape || id == Gosu::KbQ
			GameState.switch(MenuState.instance)
		end
	end

	def collision?(object_1, object_2)
    hitbox_1, hitbox_2 = object_1.hitbox, object_2.hitbox
    common_x = hitbox_1[:x] & hitbox_2[:x]
    common_y = hitbox_1[:y] & hitbox_2[:y]
    common_x.size > 0 && common_y.size > 0
  	rescue
  end

  def detect_collisions
	    if collision?(@tie_fighter, @xwing)
	    	# $scores << @xwing.score
	    	@xwing.kill
	    	explosion.play.volume=0.8
	    end
    if @tie_fighter.tie_laser
	  	if collision?(@tie_fighter.tie_laser, @xwing)
	  		# $scores << @xwing.score
	  		@xwing.kill
	  		explosion.play.volume=0.8
	  	end
  	end
  	if @xwing.xwing_laser
  		if collision?(@xwing.xwing_laser, @tie_fighter)
  			@tie_fighter.kill
  			@tie_fighter.z += -1
  			if @tie_fighter.tie_laser
  				@tie_fighter.tie_laser.z += -1
  			end
  			if @xwing.xwing_laser
  				@xwing.xwing_laser.z += -1
  			end
  			@explosions.push(Explosion.new(@animation, @tie_fighter.x, @tie_fighter.y))
  			@xwing.xwing_laser.kill
  			explosion.play.volume=0.6
  			@xwing.score += 1
  		end
  	end
  end

end