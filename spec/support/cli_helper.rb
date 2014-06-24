require 'open3'

module CliHelper
  BIN = File.expand_path('../../../bin', __FILE__)
  def run_cli(commands)
    env = {'PATH' => "#{BIN}:#{ENV['PATH']}"}
    out, status = Open3.capture2e env, 'bundle exec gorobotgo', stdin_data: commands
  end

  def cli_output_for(commands)
    out, status = run_cli commands
    out
  end
end
