#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/debian/robot_delivery_system/src/perception"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/debian/robot_delivery_system/install_isolated/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/debian/robot_delivery_system/install_isolated/lib/python3/dist-packages:/home/debian/robot_delivery_system/build_isolated/perception/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/debian/robot_delivery_system/build_isolated/perception" \
    "/usr/bin/python3" \
    "/home/debian/robot_delivery_system/src/perception/setup.py" \
     \
    build --build-base "/home/debian/robot_delivery_system/build_isolated/perception" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/debian/robot_delivery_system/install_isolated" --install-scripts="/home/debian/robot_delivery_system/install_isolated/bin"
