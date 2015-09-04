#Turtle Robot

###Description
A simulation of a toy robot moving around on a 5x5 square tabletop.
###Environments
Code was developed on Ubuntu 14.04 x86_64 but should work on any machine with Ruby 2.0+
###System Dependencies and Config:
* ruby => 2.0
* rspec => 3.3.2 (for testing)

###Installation
Assuming you have the relevant dependencies installed, there is no additional installation needed.
###Operation 
Run the interactive prompt via command line ruby bot_prompt.rb. The bot must be first placed before other actions are enabled. The list of commands are :
* **Place(x,y,f)** Place the robot at coordinates x,y and facing f. The bot must be placed within the table—x=[0..4], y=[0..4]. The valid facings are north,west, south and east.  
* **Move** Move the robot one unit in the direction it faces
* **Right** Turn the robot right
* **Left** Turn the robot left 
* **Report** Report robot location and heading

###Testing
Rspec is used to test the robot class. You can run the test by typing in the command line rspec bot_spec.rb
###License
Creative Commons Attribution 4.0. 

