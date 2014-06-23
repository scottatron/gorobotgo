require_relative '../support/cli_helper'

describe 'General Fitness' do
  include CliHelper

  describe do
    let(:commands) do
      <<-eof
      PLACE 0,0,NORTH
      MOVE
      REPORT
      eof
    end
    subject { cli_output_for commands }
    it      { should eq "0,1,NORTH\n" }
  end

  describe do
    let :commands do
      <<-eof
      PLACE 0,0,NORTH
      LEFT
      REPORT
      eof
    end
    subject { cli_output_for commands }
    it      { should eq "0,0,WEST\n" }
  end

  describe do
    let :commands do
      <<-eof
      PLACE 1,2,EAST
      MOVE
      MOVE
      LEFT
      MOVE
      REPORT
      eof
    end
    subject { cli_output_for commands }
    it      { should eq "3,3,NORTH\n" }
  end

  describe do
    let :commands do
      <<-eof
      PLACE 2,4,NORTH
      MOVE
      RIGHT
      MOVE
      MOVE
      REPORT
      eof
    end
    subject { cli_output_for commands }
    it      { should eq "4,4,EAST\n" }
  end

end