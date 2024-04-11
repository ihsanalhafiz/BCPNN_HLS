SRC_DIR		= ./src
APP_DIR     = ./apps

DEPS 		= $(SRC_DIR)/Pop.h $(SRC_DIR)/Prj.h $(SRC_DIR)/Globals.h $(SRC_DIR)/Pats.h $(SRC_DIR)/Parseparam.h $(SRC_DIR)/Logger.h
OBJS 		= $(SRC_DIR)/Pop.o $(SRC_DIR)/Prj.o $(SRC_DIR)/Globals.o $(SRC_DIR)/Pats.o $(SRC_DIR)/Parseparam.o $(SRC_DIR)/Logger.o

CXX			= g++

INCLUDE		= -I$(SRC_DIR) # for header files

FLAGS		= -O3

%.o: %.cpp $(DEPS)
	$(CXX) -c -o $@ $< $(INCLUDE) $(FLAGS) 

reprlearn: $(APP_DIR)/reprlearn/reprlearnmain.o $(OBJS)
	$(CXX) -o $(APP_DIR)/reprlearn/reprlearnmain $^ $(INCLUDE) $(FLAGS)

all: reprlearn

.PHONY: clean
clean : 
	rm -f *.o *.bin *.log *.png *.gif *.out out.txt err.txt *~ core reprlearnmain
	rm -f $(SRC_DIR)/*.o $(SRC_DIR)/*.bin $(SRC_DIR)/*~
	rm -f $(APP_DIR)/reprlearn/*.o $(APP_DIR)/reprlearn/*~ $(APP_DIR)/reprlearn/reprlearnmain
