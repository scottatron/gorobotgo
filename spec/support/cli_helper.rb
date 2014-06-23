require 'open3'

module CliHelper
  BIN = File.expand_path('../../../bin', __FILE__)
  def run_cli(commands)
    env = {'PATH' => "#{BIN}:#{ENV['PATH']}"}
    out, status = Open3.capture2e env, 'gorobotgo', stdin_data: commands
  end
end
