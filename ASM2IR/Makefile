LLVM_CONFIG ?= llvm-config
BUILD ?= build
CMAKE_FLAGS ?=
.PHONY: all check clean
all:
	cmake -S . -B $(BUILD) -DLLVM_DIR="$$($(LLVM_CONFIG) --cmakedir)" -DCMAKE_BUILD_TYPE=Release $(CMAKE_FLAGS)
	cmake --build $(BUILD) -j 2
check: all
	ctest --test-dir $(BUILD) --output-on-failure
clean:
	$(RM) -r $(BUILD)
