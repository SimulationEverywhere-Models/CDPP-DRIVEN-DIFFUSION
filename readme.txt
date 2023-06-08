List of files:
DrivenDiffusion.doc             the final report of the project    
DrivenDiffusion.ma  		the model definition file
DrivenDiffusion.inc       	Macro definition file
DrivenDiffusion.val             Initial value to run the model (manually created)
diffusion.pal   		defining the colors for cells
diffusion.drw     		output of drawlog
execute.bat     		batch file to simulate the model with inital values
drawlog.bat     		batch file to generate .drw file that can be viewed by cd++ modeler. 

DrivenDiffusion10.ma            model definition file for density of 10%
DrivenDiffusion20.ma            model definition file for density of 20%
DrivenDiffusion40.ma            model definition file for density of 40%
DrivenDiffusion50.ma            model definition file for density of 50%
DrivenDiffusion70.ma            model definition file for density of 70%

DrivenTest10.val               initial value file for density of 10%
DrivenTest20.val               initial value file for density of 20%
DrivenTest40.val               initial value file for density of 40%
DrivenTest50.val               initial value file for density of 50%
DrivenTest70.val               initial value file for density of 70%

diffusion10.drw                draw file for density of 10%
diffusion20.drw                draw file for density of 20%
diffusion40.drw                draw file for density of 40%
diffusion50.drw                draw file for density of 50%
diffusion70.drw                draw file for density of 70%

execute10.bat     		batch file to simulate the model with density of 10% 
drawlog10.bat     		batch file to generate .drw file with density of 10% 
execute20.bat     		batch file to simulate the model with density of 20% 
drawlog20.bat     		batch file to generate .drw file with density of 20% 
execute40.bat     		batch file to simulate the model with density of 40% 
drawlog40.bat     		batch file to generate .drw file with density of 40% 
execute50.bat     		batch file to simulate the model with density of 50% 
drawlog50.bat     		batch file to generate .drw file with density of 50% 
execute70.bat     		batch file to simulate the model with density of 70% 
drawlog70.bat     		batch file to generate .drw file with density of 70% 

InitValGen.java                 java program to generate initial values

To run the model:

Configure execute.bat, execute10.bat, execute20.bat and etc. (set the simulator path) and run them in Cygwin, you can get .log file and .out files

Validate the results:

1. configure drawlog.bat, drawlog10.bat, drawlog20.bat and etc. (set the drawlog path) and run them in Cygwin, you can get .drw, check the cell values.

2. use cd++ Modeler with the definition of colors for different values of each cellar, validate the distribution of cell space. 

To generate initial vaues with a particular density and space size, compile the java program and invoke it as follows:
java InitValGen <density> <cell space size> <filename>

Note: the generated cell space is n X n where n is the specified size in the command line.







