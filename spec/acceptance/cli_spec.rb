require 'open3'
require 'priscilla'

BIN = File.expand_path('../../../bin', __FILE__)

describe 'gorobotgo' do

  # Given a command list - cmds:
  #   PLACE 0,0,NORTH
  #   MOVE
  #   REPORT
  # When I run gorobotgo cmds
  # STDOUT should be 0,1,NORTH
  let(:commands) do
    <<-eof
    PLACE 0,0,NORTH
    MOVE
    REPORT
    eof
  end
  it 'runs a run list of commands and returns any output' do
    env = {'PATH' => "#{BIN}:#{ENV['PATH']}"}
    out, status = Open3.capture2e env, 'gorobotgo', stdin_data: commands
    expect(out).to eq '0,1,NORTH'
  end

end
