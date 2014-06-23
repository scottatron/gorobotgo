require_relative '../lib/robot'

describe Robot do
  let(:robot) { Robot.new }

  describe '#run_cmd' do
    it 'proxies a command from the run list' do
      robot = Robot.new
      expect(robot).to receive(:place).with('1', '1', 'EAST')
      robot.run_cmd 'PLACE', ['1', '1', 'EAST']
    end

    it 'ignores any commands that don\'t exist'
  end

  describe '#place' do
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

    context 'when a coordinate is invalid' do
      it 'ignores the PLACE command' do
        robot = Robot.new
        robot.place('-1', '1', 'WEST')
        expect(robot.x_position).to be_nil
        expect(robot.y_position).to be_nil
        expect(robot.direction).to be_nil
      end
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

    context 'when direction is SOUTH' do
      let(:robot) { Robot.new.tap {|r| r.place('2', '1', 'SOUTH') } }
      it 'decrements Y position by 1' do
        robot.move
        expect(robot.y_position).to eq 0
      end
    end

    context 'when direction is EAST' do
      let(:robot) { Robot.new.tap {|r| r.place('2', '1', 'EAST') } }
      it 'increments X position by 1' do
        robot.move
        expect(robot.x_position).to eq 3
      end
    end

    context 'when direction is WEST' do
      let(:robot) { Robot.new.tap {|r| r.place('2', '1', 'WEST') } }
      it 'decrements X position by 1' do
        robot.move
        expect(robot.x_position).to eq 1
      end
    end

    context 'when move would see the robot fall off the edge of table' do
      it 'ignores the MOVE command'
    end

  end

  describe '#left' do
    it 'rotates the direction counter-clockwise by 90 degrees'
  end

  describe '#right' do
    it 'rotates the direction clockwise by 90 degrees'
  end

  describe '#report' do
    it 'returns current X and Y position, and direction as a comma delimited string' do
      robot = Robot.new.tap {|r| r.place('2', '1', 'NORTH') }
      expect(robot.report).to eq '2,1,NORTH'
    end
  end

  describe '#valid_coordinate?(axis, val)' do
    it 'is false for negative numbers' do
      expect(robot.valid_coordinate? :x, -1).to eq false
    end
    it 'is false if larger the the table width' do
      expect(robot.valid_coordinate? :x, 100).to eq false
    end
    it 'is false if larger the the table height' do
      expect(robot.valid_coordinate? :y, 100).to eq false
    end
    it 'is true if within the table width' do
      expect(robot.valid_coordinate? :x, 4).to eq true
    end
    it 'is true if within the table height' do
      expect(robot.valid_coordinate? :y, 2).to eq true
    end
  end

end