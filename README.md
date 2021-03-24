# uuav_rotator
uuav_rotator
```
git clone https://github.com/SwonGao/uuav_rotator.git
cd build
make

roslaunch px4 uuav.launch
```
The angle is controlled by a P controller.
To change the desired angle:
```
rosservice call /rotator/
```
