require_relative '../support/cli_helper'

describe 'gorobotgo' do
  include CliHelper

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
    out, status = run_cli commands
    expect(out).to eq "0,1,NORTH\n"
  end

  it 'returns multiple lines of output' do
    out = cli_output_for "PLACE 0,0,EAST\nMOVE\nREPORT\nMOVE\nREPORT"
    expect( out ).to eq "1,0,EAST\n2,0,EAST\n"
  end

end
