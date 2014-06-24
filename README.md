# gorobotgo

Control a toy robot on a table-top, consisting of 5 units by 5 units.

## Installation

Add this line to your application's Gemfile:

    gem 'gorobotgo', github: 'scottatron/gorobotgo'

And then execute:

    $ bundle

## Usage

## Usage

### Commands

There are 5 commands which the robot will respond to:

- PLACE X,Y,DIRECTION
- MOVE
- LEFT
- RIGHT
- REPORT

#### PLACE

The first command issued must be a PLACE command to place the robot on the table and set its direction. Any commands issued prior to the initial PLACE command will be ignored.

The origin position—**0,0**—is the south-west corner of the table.

Valid directions are the compass points NORTH, SOUTH, EAST, WEST.

PLACE commands which would place the robot off the edge of the table will be ignored.

#### MOVE

MOVE will move the robot 1 space forward in the direction it is currently facing.

MOVE commands which would move the robot off the edge of the table will be ignored.

#### LEFT / RIGHT

The LEFT and RIGHT commands change the current direction of the robot by 90 degrees. 

LEFT turns the robot counter-clockwise and RIGHT turns it clockwise.

#### REPORT

The REPORT command returns the current X and Y coordinates of the robot as well as its current direction.

_Sample output:_ `1,3,EAST`

### Run List

A run list is a plain text list of commands provided to the robot that will be executed sequentially.

One command should be provided per line and any commands that are not understood will be ignored.

As above, any commands issued prior to the the first valid PLACE command will be ignored.

### CLI

A CLI tool named `gorobotgo` is provided which will issue a run list to the robot and return any output to STDOUT.

One or more run lists can be specified by passing filenames as arguments:

		gorobotgo runlist1.txt runlist2.txt

A run list can also be provided STDIN

		curl http://robot-commands-are-us.com/disco-dancing.txt | gorobotgo

### Using the Robot class

You can also use the Robot class directly and issue commands using the instance method `run_cmd`

		@robot = Robot.new
		@robot.run_cmd 'PLACE', ['1','2','NORTH']
		@robot.run_cmd 'LEFT'
		@robot.run_cmd 'MOVE'
		@robot.run_cmd 'REPORT'

Command arguments should be passed as an array as shown for the above PLACE command.

## Contributing

1. Fork it ( https://github.com/scottatron/gorobotgo/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
