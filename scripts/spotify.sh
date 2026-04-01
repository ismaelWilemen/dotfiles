#!/bin/bash
exec > /tmp/spotify-launch.log 2>&1
/home/rakis/.spicetify/spicetify apply
spotify-launcher
