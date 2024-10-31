SRC := .
MATH := math/src
IO := io/src
UTILS := utils/src
EXTRA := extra/src


SRCS := $(SRC)/main.c $(MATH)/math.c $(IO)/io.c $(UTILS)/utils.c
EXTRA_SRC := $(EXTRA)/extra.c




ifdef EXTRA
	CFLAGS += -DEXTRA=1
	BUILD_DIR := build1
	SRCS += $(EXTRA_SRC)
endif

ifdef OPTIMIZE
	CFLAGS += -O2
	BUILD_DIR := build2
endif



all: 	
	
	@mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -o $@ $^

	$(BUILD_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf build build1 build2


help:
	@echo "Makefile:"
	@echo "make                - Compile and build the project."
	@echo "make EXTRA=1        - Compile with extra output build1."
	@echo "make OPTIMIZE=1     - Compile optimization, output build2."
	@echo "make clean          - Remove all ."
	@echo "make help           - Display help message."
