# Define minimal required version of CMake.
cmake_minimum_required(VERSION "3.25")

# Project definition
project(
	blink_baremetal_test
	VERSION 1.0
	LANGUAGES C CXX ASM
)

# Include the definition of the slc_blink_baremetal_test target,
# which contains the content of the SLC project
include(blink_baremetal_test.cmake)

# project source files
file(GLOB PROJECT_SOURCE_FILES CONFIGURE_DEPENDS ../src/*.c)

add_executable(blink_baremetal_test
    # Add additional sources here
    ${PROJECT_SOURCE_FILES}
)

target_include_directories(blink_baremetal_test PUBLIC
    # Add additional include paths here
    ../src
)

target_compile_definitions(blink_baremetal_test PUBLIC
    # Add additional macros here
)

target_compile_options(blink_baremetal_test PUBLIC
    # Set additional compiler flags here
)

target_link_options(blink_baremetal_test PUBLIC
    # Set additional linker flags here
)

# Link with the content defined in the SLC project
target_link_libraries(blink_baremetal_test PRIVATE
    slc_blink_baremetal_test
)

# Include managed project content if available
include(blink_baremetal_test_project.cmake OPTIONAL RESULT_VARIABLE managed_project)
if(managed_project)
    message(STATUS "Using managed project content from ${managed_project}")
endif()

# Force the gcc linker command
set_target_properties(blink_baremetal_test PROPERTIES LINKER_LANGUAGE C)

# Create .bin, .hex and .s37 artifacts after building the project
add_custom_command(TARGET blink_baremetal_test
    POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O srec "$<TARGET_FILE:blink_baremetal_test>" "$<TARGET_FILE_DIR:blink_baremetal_test>/$<TARGET_FILE_BASE_NAME:blink_baremetal_test>.s37"
    COMMAND ${CMAKE_OBJCOPY} -O ihex "$<TARGET_FILE:blink_baremetal_test>" "$<TARGET_FILE_DIR:blink_baremetal_test>/$<TARGET_FILE_BASE_NAME:blink_baremetal_test>.hex"
    COMMAND ${CMAKE_OBJCOPY} -O binary "$<TARGET_FILE:blink_baremetal_test>" "$<TARGET_FILE_DIR:blink_baremetal_test>/$<TARGET_FILE_BASE_NAME:blink_baremetal_test>.bin" 
)

# Run post-build pipeline to perform additional post-processing
if(post_build_command)
add_custom_command(TARGET blink_baremetal_test
    POST_BUILD
    WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/..
    COMMAND ${post_build_command}
)
endif()