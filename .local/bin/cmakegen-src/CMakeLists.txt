cmake_minimum_required(VERSION 3.10)

project(main LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(${PROJECT_NAME}
	src/main.cpp
)

target_include_directories(${PROJECT_NAME}
	PRIVATE ${PROJECT_SOURCE_DIR}/include)

set_target_properties(${PROJECT_NAME}
  PROPERTIES
	RUNTIME_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/bin/$<CONFIG>")
