#!/bin/bash

play ~/.utils/rsscrot/camera-shutter-click-03.mp3 > /dev/null 2>&1 &
scrot ~/Images/screenshots/%Y-%m-%d-%T-screenshot.png &
