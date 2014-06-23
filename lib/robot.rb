require 'pry'

class Robot
  attr_reader :x_position, :y_position, :direction

  TABLE_WIDTH  = 5
  TABLE_HEIGHT = 5

  def run_cmd(cmd, args)
    send cmd.downcase, *args
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

  end

  def right

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
