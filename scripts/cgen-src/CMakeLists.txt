cmake_minimum_required(VERSION 3.10)

project(main)

if(NOT CMAKE_BUILD_TYPE)
	set(CMAKE_BUILD_TYPE debug)
	add_compile_options(-Wall)
	add_compile_options(-Wextra)
	add_compile_options(-Wshadow)
	add_compile_options(-Weffc++)
	add_compile_options(-pedantic-errors)
	add_compile_options(-fstack-protector)
	add_compile_options(-fsanitize=address)
	add_compile_options(-fsanitize=undefined)
	add_link_options(-fsanitize=address)
	add_link_options(-fsanitize=undefined)
endif()

add_executable(${PROJECT_NAME}
	src/main.c)

target_include_directories(${PROJECT_NAME}
	PRIVATE ${PROJECT_SOURCE_DIR}/include)

set_target_properties(${PROJECT_NAME}
    PROPERTIES
	RUNTIME_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/bin/$<CONFIG>")
