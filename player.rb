class Player
  ROTATION_SPEED = 3
  ACCELERATION = 2
  FRICTION = 0.9
  attr_reader :x, :y, :angle, :radius

  def initialize(window)
    @x = 200
    @y = 200
    @angle = 0
    @image = Gosu::Image.new('images/ship.png')
    @velocity_x = 0
    @velocity_y = 0
    @window = window
    @radius = 20
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end

  def turn_right
    @angle += ROTATION_SPEED
  end

  def turn_left
    @angle -= ROTATION_SPEED
  end

  def move
    @x += @velocity_x
    @y += @velocity_y
    @velocity_x *= FRICTION  #slows the ship down
    @velocity_y *= FRICTION
    if @x > @window.width - @radius #if it hits the left edge
      @velocity_x = 0 #stop it
      @x = @window.width - @radius #move it to the edge
    end
    if @x < @radius #same but for the right edge
      @velocity_x = 0
      @x = @radius
    end
    if @y > @window.height - @radius #same but for the bottom edge
      @velocity_y = 0
      @y = @window.height - @radius
    end

  end

  def accelerate
    @velocity_x += Gosu.offset_x(@angle, ACCELERATION)
    @velocity_y += Gosu.offset_y(@angle, ACCELERATION)
  end

end
