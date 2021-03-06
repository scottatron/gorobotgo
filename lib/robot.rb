require 'pry'

class Robot
  attr_reader :x_position, :y_position, :direction

  TABLE_WIDTH  = 5
  TABLE_HEIGHT = 5

  def run_cmd(cmd, args = nil)
    if respond_to? cmd.downcase
      send cmd.downcase, *args
    end
  end

  def place(x, y, direction)
    x, y = x.to_i, y.to_i
    if valid_coordinate?(:x, x) && valid_coordinate?(:y, y)
      @x_position = x
      @y_position = y
      @direction  = direction
    end
    nil
  end

  def move
    case direction
    when 'NORTH'
      @y_position += 1 if can_move? :north
    when 'SOUTH'
      @y_position -= 1 if can_move? :south
    when 'EAST'
      @x_position += 1 if can_move? :east
    when 'WEST'
      @x_position -= 1 if can_move? :west
    end
    nil
  end

  def left
    case direction
    when 'NORTH'
      @direction = 'WEST'
    when 'EAST'
      @direction = 'NORTH'
    when 'SOUTH'
      @direction = 'EAST'
    when 'WEST'
      @direction = 'SOUTH'
    end
    nil
  end

  def right
    case direction
    when 'NORTH'
      @direction = 'EAST'
    when 'EAST'
      @direction = 'SOUTH'
    when 'SOUTH'
      @direction = 'WEST'
    when 'WEST'
      @direction = 'NORTH'
    end
    nil
  end

  def report
    [x_position, y_position, direction].compact.join(',')
  end

  def valid_coordinate?(axis, coordinate)
    return false if coordinate < 0
    return false if axis.to_sym == :x && coordinate >= TABLE_WIDTH
    return false if axis.to_sym == :y && coordinate >= TABLE_HEIGHT
    true
  end

  def can_move?(direction)
    case direction
    when :north
      true unless y_position + 1 >= TABLE_HEIGHT
    when :south
      true unless y_position - 1 < 0
    when :east
      true unless x_position + 1 >= TABLE_WIDTH
    when :west
      true unless x_position - 1 < 0
    end
  end

end
