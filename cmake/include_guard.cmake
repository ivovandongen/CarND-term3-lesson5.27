# Include guard (include_guard is not included in older cmake version)
macro(INCLUDE_GUARD_X GUARD_NAME)

    GET_PROPERTY(GUARD_VALUE GLOBAL PROPERTY ${GUARD_NAME})

    if(GUARD_VALUE)
        return()
    endif()

    SET_PROPERTY(GLOBAL PROPERTY ${GUARD_NAME} TRUE)

endmacro(INCLUDE_GUARD_X)