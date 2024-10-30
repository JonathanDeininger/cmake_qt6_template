cmake_minimum_required(VERSION 3.10)

project(helloworld)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Set the CMAKE_PREFIX_PATH to your Qt installation directory
set(CMAKE_PREFIX_PATH "C:/Qt/6.8.0/mingw_64")

# Find the Qt libraries for Qt Quick/QML
find_package(Qt6 REQUIRED COMPONENTS Qml Quick Gui Core)

# add the qml.qrc file
qt6_add_resources(qml_QRC src/qml.qrc)

# add source files
set(SOURCE 
    src/main.cpp
)

# Tell CMake to create the helloworld executable
add_executable(helloworld ${SOURCE} ${qml_QRC})

# Use the Qml/Quick modules from Qt 6.
target_link_libraries(helloworld Qt6::Qml Qt6::Quick Qt6::Gui Qt6::Core)

# post-build steps
# copy all the Qt support files to the debug/release directories
# You really only need the proper qt redistribution dll's/files, but this copies everything for easier development. Trim files out as needed.
message("Copying required Qt libraries and binaries to output directory....")
add_custom_command(TARGET helloworld POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_PREFIX_PATH}/bin $<TARGET_FILE_DIR:helloworld>)
add_custom_command(TARGET helloworld POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_PREFIX_PATH}/plugins $<TARGET_FILE_DIR:helloworld>)
add_custom_command(TARGET helloworld POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_PREFIX_PATH}/qml $<TARGET_FILE_DIR:helloworld>)