###############################################################################
# Family : buildroot
# Tuple : arm-buildroot-linux-gnueabli
# Sysroot : /i/dont/know/yet
###############################################################################

# Some useful custom variables that uniquely define this toolchain module
set(TOOLCHAIN_FAMILY "buildroot" CACHE STRING "Convenient grouping identifier for collections of toolchains (e.g. ubuntu, nexell, sourcery).")
set(TOOLCHAIN_TUPLE "arm-buildroot-linux-gnueabi" CACHE STRING "Toolchain signature identifying cpu-vendor-platform-clibrary.")
set(TOOLCHAIN_ROOT "/opt/nexell/location/of/deb/toolchain/root" CACHE STRING "Root of the installed toolchain")
set(TOOLCHAIN_SYSROOT "${TOOLCHAIN_ROOT}/${TOOLCHAIN_TUPLE}/sys-root" CACHE STRING "Root of the target development environment (libraries, headers etc).")
#set(TOOLCHAIN_INSTALL_PREFIX "${TOOLCHAIN_SYSROOT}/usr" CACHE STRING "Preferred install location when using the toolchain.")
set(TOOLCHAIN_NAME_PREFIX "${TOOLCHAIN_ROOT}/bin/${TOOLCHAIN_TUPLE}-")

# Now the cmake variables
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR "arm")
set(CMAKE_C_COMPILER    ${TOOLCHAIN_ROOT}/bin/${TOOLCHAIN_TUPLE}-gcc) # Make sure these are in your PATH
set(CMAKE_CXX_COMPILER  ${TOOLCHAIN_ROOT}/bin/${TOOLCHAIN_TUPLE}-g++)
set(CMAKE_FIND_ROOT_PATH ${TOOLCHAIN_SYSROOT} CACHE STRING "Cmake search variable for finding libraries/headers.")
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER) # Don't search for programs in sysroot
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)  # Headers and libs from sysroot only
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# Hide from cache's front page
MARK_AS_ADVANCED(CMAKE_GENERATOR CMAKE_FIND_ROOT_PATH CMAKE_TOOLCHAIN_FILE TOOLCHAIN_FAMILY TOOLCHAIN_TUPLE TOOLCHAIN_SYSROOT)
