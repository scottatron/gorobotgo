require_relative '../support/cli_helper'

describe 'Robot Safety' do
  include CliHelper

  it 'ignores PLACE commands with an X value larger than the table width' do
    out, status = run_cli <<-eof
    PLACE 20,1,SOUTH
    REPORT
    eof
    expect(out).to eq "\n"
  end

  it 'ignores PLACE commands with an Y value larger than the table height' do
    out, status = run_cli <<-eof
    PLACE 1,20,SOUTH
    REPORT
    eof
    expect(out).to eq "\n"
  end

  it 'ignores PLACE commands with a negative X value' do
    out, status = run_cli <<-eof
    PLACE -1,1,SOUTH
    REPORT
    eof
    expect(out).to eq "\n"
  end

  it 'ignores PLACE commands with a negative Y value' do
    out, status = run_cli <<-eof
    PLACE 1,-1,SOUTH
    REPORT
    eof
    expect(out).to eq "\n"
  end

  it 'ignores invalid MOVE commands to the NORTH' do
    out, status = run_cli <<-eof
    PLACE 4,4,NORTH
    MOVE
    REPORT
    eof
    expect(out).to eq "4,4,NORTH\n"
  end

  it 'ignores invalid MOVE commands to the SOUTH' do
    out, status = run_cli <<-eof
    PLACE 3,0,SOUTH
    MOVE
    REPORT
    eof
    expect(out).to eq "3,0,SOUTH\n"
  end

  it 'ignores invalid MOVE commands to the EAST' do
    out, status = run_cli <<-eof
    PLACE 4,2,EAST
    MOVE
    REPORT
    eof
    expect(out).to eq "4,2,EAST\n"
  end

  it 'ignores invalid MOVE commands to the WEST' do
    out, status = run_cli <<-eof
    PLACE 0,2,WEST
    MOVE
    REPORT
    eof
    expect(out).to eq "0,2,WEST\n"
  end

end
