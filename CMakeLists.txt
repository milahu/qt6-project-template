cmake_minimum_required(VERSION 3.16)

set(project_name hello-qt6)

project(${project_name} VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

message(STATUS "Find Qt6 ...")
find_package(Qt6 REQUIRED COMPONENTS Core Widgets)

# not needed
#qt_standard_project_setup()



set(target_name ${project_name})

add_executable(${target_name}
    src/main-cli.cc # CLI app
    #src/main.cc # GUI app
)

target_include_directories(${target_name}
  PRIVATE
  ${Qt6_INCLUDE_DIRS}
)

target_link_libraries(${target_name}
  PRIVATE
  Qt6::Core # CLI app
  #Qt6::Widgets # GUI app: QApplication ...
)

install(TARGETS ${target_name}
  DESTINATION bin
)
