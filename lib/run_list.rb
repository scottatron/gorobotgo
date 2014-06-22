class RunList
  attr_reader :commands

  def initialize(commands = "")
    @commands = commands.split("\n").map(&:strip)
  end

  def commands_with_args
    @commands_with_args ||= commands.map do |c|
      parse_command_and_args c
    end
  end

  def parse_command_and_args(str)
    cmd, args = str.split(' ')
    args.nil? ? [cmd] : [cmd, args.split(',')]
  end

  def find_first_place_command
    commands_with_args.index {|c| c.first == 'PLACE' }
  end

  def runnable_commands
    @runnable_commands ||= commands_with_args[find_first_place_command, commands.length]
  end

end