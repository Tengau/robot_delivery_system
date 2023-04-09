# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "localization: 2 messages, 1 services")

set(MSG_I_FLAGS "-Ilocalization:/home/debian/robot_delivery_system/src/localization/msg;-Igeometry_msgs:/home/debian/ros_catkin_ws/install_isolated/share/geometry_msgs/cmake/../msg;-Istd_msgs:/home/debian/ros_catkin_ws/install_isolated/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(localization_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/debian/robot_delivery_system/src/localization/msg/Instruction.msg" NAME_WE)
add_custom_target(_localization_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "localization" "/home/debian/robot_delivery_system/src/localization/msg/Instruction.msg" ""
)

get_filename_component(_filename "/home/debian/robot_delivery_system/src/localization/msg/Instructions.msg" NAME_WE)
add_custom_target(_localization_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "localization" "/home/debian/robot_delivery_system/src/localization/msg/Instructions.msg" "localization/Instruction"
)

get_filename_component(_filename "/home/debian/robot_delivery_system/src/localization/srv/GpsConverter.srv" NAME_WE)
add_custom_target(_localization_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "localization" "/home/debian/robot_delivery_system/src/localization/srv/GpsConverter.srv" "geometry_msgs/Point"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(localization
  "/home/debian/robot_delivery_system/src/localization/msg/Instruction.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/localization
)
_generate_msg_cpp(localization
  "/home/debian/robot_delivery_system/src/localization/msg/Instructions.msg"
  "${MSG_I_FLAGS}"
  "/home/debian/robot_delivery_system/src/localization/msg/Instruction.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/localization
)

### Generating Services
_generate_srv_cpp(localization
  "/home/debian/robot_delivery_system/src/localization/srv/GpsConverter.srv"
  "${MSG_I_FLAGS}"
  "/home/debian/ros_catkin_ws/install_isolated/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/localization
)

### Generating Module File
_generate_module_cpp(localization
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/localization
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(localization_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(localization_generate_messages localization_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/debian/robot_delivery_system/src/localization/msg/Instruction.msg" NAME_WE)
add_dependencies(localization_generate_messages_cpp _localization_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/debian/robot_delivery_system/src/localization/msg/Instructions.msg" NAME_WE)
add_dependencies(localization_generate_messages_cpp _localization_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/debian/robot_delivery_system/src/localization/srv/GpsConverter.srv" NAME_WE)
add_dependencies(localization_generate_messages_cpp _localization_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(localization_gencpp)
add_dependencies(localization_gencpp localization_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS localization_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(localization
  "/home/debian/robot_delivery_system/src/localization/msg/Instruction.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/localization
)
_generate_msg_eus(localization
  "/home/debian/robot_delivery_system/src/localization/msg/Instructions.msg"
  "${MSG_I_FLAGS}"
  "/home/debian/robot_delivery_system/src/localization/msg/Instruction.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/localization
)

### Generating Services
_generate_srv_eus(localization
  "/home/debian/robot_delivery_system/src/localization/srv/GpsConverter.srv"
  "${MSG_I_FLAGS}"
  "/home/debian/ros_catkin_ws/install_isolated/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/localization
)

### Generating Module File
_generate_module_eus(localization
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/localization
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(localization_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(localization_generate_messages localization_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/debian/robot_delivery_system/src/localization/msg/Instruction.msg" NAME_WE)
add_dependencies(localization_generate_messages_eus _localization_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/debian/robot_delivery_system/src/localization/msg/Instructions.msg" NAME_WE)
add_dependencies(localization_generate_messages_eus _localization_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/debian/robot_delivery_system/src/localization/srv/GpsConverter.srv" NAME_WE)
add_dependencies(localization_generate_messages_eus _localization_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(localization_geneus)
add_dependencies(localization_geneus localization_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS localization_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(localization
  "/home/debian/robot_delivery_system/src/localization/msg/Instruction.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/localization
)
_generate_msg_lisp(localization
  "/home/debian/robot_delivery_system/src/localization/msg/Instructions.msg"
  "${MSG_I_FLAGS}"
  "/home/debian/robot_delivery_system/src/localization/msg/Instruction.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/localization
)

### Generating Services
_generate_srv_lisp(localization
  "/home/debian/robot_delivery_system/src/localization/srv/GpsConverter.srv"
  "${MSG_I_FLAGS}"
  "/home/debian/ros_catkin_ws/install_isolated/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/localization
)

### Generating Module File
_generate_module_lisp(localization
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/localization
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(localization_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(localization_generate_messages localization_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/debian/robot_delivery_system/src/localization/msg/Instruction.msg" NAME_WE)
add_dependencies(localization_generate_messages_lisp _localization_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/debian/robot_delivery_system/src/localization/msg/Instructions.msg" NAME_WE)
add_dependencies(localization_generate_messages_lisp _localization_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/debian/robot_delivery_system/src/localization/srv/GpsConverter.srv" NAME_WE)
add_dependencies(localization_generate_messages_lisp _localization_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(localization_genlisp)
add_dependencies(localization_genlisp localization_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS localization_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(localization
  "/home/debian/robot_delivery_system/src/localization/msg/Instruction.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/localization
)
_generate_msg_nodejs(localization
  "/home/debian/robot_delivery_system/src/localization/msg/Instructions.msg"
  "${MSG_I_FLAGS}"
  "/home/debian/robot_delivery_system/src/localization/msg/Instruction.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/localization
)

### Generating Services
_generate_srv_nodejs(localization
  "/home/debian/robot_delivery_system/src/localization/srv/GpsConverter.srv"
  "${MSG_I_FLAGS}"
  "/home/debian/ros_catkin_ws/install_isolated/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/localization
)

### Generating Module File
_generate_module_nodejs(localization
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/localization
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(localization_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(localization_generate_messages localization_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/debian/robot_delivery_system/src/localization/msg/Instruction.msg" NAME_WE)
add_dependencies(localization_generate_messages_nodejs _localization_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/debian/robot_delivery_system/src/localization/msg/Instructions.msg" NAME_WE)
add_dependencies(localization_generate_messages_nodejs _localization_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/debian/robot_delivery_system/src/localization/srv/GpsConverter.srv" NAME_WE)
add_dependencies(localization_generate_messages_nodejs _localization_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(localization_gennodejs)
add_dependencies(localization_gennodejs localization_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS localization_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(localization
  "/home/debian/robot_delivery_system/src/localization/msg/Instruction.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/localization
)
_generate_msg_py(localization
  "/home/debian/robot_delivery_system/src/localization/msg/Instructions.msg"
  "${MSG_I_FLAGS}"
  "/home/debian/robot_delivery_system/src/localization/msg/Instruction.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/localization
)

### Generating Services
_generate_srv_py(localization
  "/home/debian/robot_delivery_system/src/localization/srv/GpsConverter.srv"
  "${MSG_I_FLAGS}"
  "/home/debian/ros_catkin_ws/install_isolated/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/localization
)

### Generating Module File
_generate_module_py(localization
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/localization
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(localization_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(localization_generate_messages localization_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/debian/robot_delivery_system/src/localization/msg/Instruction.msg" NAME_WE)
add_dependencies(localization_generate_messages_py _localization_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/debian/robot_delivery_system/src/localization/msg/Instructions.msg" NAME_WE)
add_dependencies(localization_generate_messages_py _localization_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/debian/robot_delivery_system/src/localization/srv/GpsConverter.srv" NAME_WE)
add_dependencies(localization_generate_messages_py _localization_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(localization_genpy)
add_dependencies(localization_genpy localization_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS localization_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/localization)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/localization
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(localization_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/localization)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/localization
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(localization_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/localization)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/localization
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(localization_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/localization)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/localization
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(localization_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/localization)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/localization\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/localization
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(localization_generate_messages_py geometry_msgs_generate_messages_py)
endif()
