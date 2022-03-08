#Menu Planning Problem
###################
This code addreses the menu planning problem, which is solved either a memetic algorithms or local search.
#####
The configuration can be modified as desired in the files "global.cpp" and "global.h".
##################
Note that the MPP class is derived from the MPP_Problem, while the former conatins the data of each individual, the latter storages the information of the instance.
###################
Additionally, this program requires a database of dishes with nutriments, and a file of the constraints in terms of nutriments.
The output of this program menu of dishes that better fulfill the model.
###################
The model can be modified as desired in the file "model.cpp" at the function "modelation()", note that this function computes a feasibility vector regarding to daily constraints and global constraints. 
Additionally, this funciton computes the variability of dishes as the distance to the closes dishes in therms of days.
