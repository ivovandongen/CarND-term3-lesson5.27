# Include guard (include_guard is not included in older cmake version)
macro(INCLUDE_GUARD_X GUARD_NAME)

    if(GUARD_NAME)
        return()
    endif()

    set(${GUARD_NAME} TRUE)

endmacro(INCLUDE_GUARD_X)