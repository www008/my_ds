
add_test(
    NAME
      python_test
    COMMAND
      ${CMAKE_COMMAND} -E env MY_DS_MODULE_PATH=${PROJECT_BINARY_DIR}/src
      ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/ds_test.py
    )