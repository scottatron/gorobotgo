require_relative '../lib/run_list'

describe RunList do

  let(:commands) do
    <<-eos
    PLACE 0,0,NORTH
    MOVE
    REPORT
    eos
  end

  it "splits a run list string into an array" do
    expect(RunList.new(commands).commands).to be_a Array
  end

  it "strips whitespace from each command" do
    expect(RunList.new(commands).commands).to eq ['PLACE 0,0,NORTH', 'MOVE', 'REPORT']
  end

  describe 'commands_with_arguments' do

    it "splits the command name and any arguments" do
      expect(RunList.new(commands).commands_with_args.first).to be_a Array
    end

    it "splits arguments into arrays" do
      expect(RunList.new(commands).commands_with_args.first.last).to eq ['0', '0', 'NORTH']
    end

  end

  describe '#find_first_place_command' do
    it 'finds the index of the first PLACE command' do
      expect(RunList.new(commands).find_first_place_command).to eq 0
    end
  end

  describe '#runnable_commands' do
    let(:commands) do
      <<-eof
      REPORT
      MOVE
      PLACE 0,2,NORTH
      MOVE
      MOVE
      REPORT
      eof
    end

    it 'returns the first PLACE command and all subsequent
    commands with any arguments, ready to send to a robot' do
      expect(RunList.new(commands).runnable_commands).to eq [
        ['PLACE', ['0', '2', 'NORTH']],
        ['MOVE'],
        ['MOVE'],
        ['REPORT']
      ]
    end
  end

end
