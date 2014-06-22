require_relative '../lib/robot'

describe Robot do

  describe '#run_cmd' do
    it 'proxies a command from the run list' do
      robot = Robot.new
      expect(robot).to receive(:place).with('1', '1', 'EAST')
      robot.run_cmd 'PLACE', ['1', '1', 'EAST']
    end

    it 'ignores any commands that don\'t exist'
  end

  describe '#place' do
    let(:robot)   { Robot.new }
    before(:each) { robot.place('2', '1', 'NORTH') }

    it 'returns nil' do
      expect(robot.place('2', '1', 'NORTH')).to be_nil
    end

    it 'sets current X position' do
      expect(robot.x_position).to eq 2
    end

    it 'sets current Y position' do
      expect(robot.y_position).to eq 1
    end

    it 'sets current direction' do
      expect(robot.direction).to eq 'NORTH'
    end
  end

  describe '#move' do

    it 'returns nil' do
      robot = Robot.new
      expect(robot.move).to be_nil
    end

    context 'when direction is NORTH' do
      let(:robot) { Robot.new.tap {|r| r.place('2', '1', 'NORTH') } }
      it 'increments Y position by 1' do
        robot.move
        expect(robot.y_position).to eq 2
      end
    end

  end

  describe '#report' do
    it 'returns current X and Y position, and direction as a comma delimited string' do
      robot = Robot.new.tap {|r| r.place('2', '1', 'NORTH') }
      expect(robot.report).to eq '2,1,NORTH'
    end
  end

end
