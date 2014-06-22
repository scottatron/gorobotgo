require 'pry'

class Robot
  attr_reader :x_position, :y_position, :direction

  def run_cmd(cmd, args)
    send cmd.downcase, *args
  end

  def place(x, y, direction)
    @x_position = x.to_i
    @y_position = y.to_i
    @direction  = direction
    nil
  end

  def move
    case direction
    when 'NORTH'
      @y_position += 1
    end
    nil
  end

  def left

  end

  def right

  end

  def report
    [x_position, y_position, direction].join(',')
  end

end
