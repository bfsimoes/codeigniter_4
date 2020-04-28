#!/bin/bash
writable_folder="/var/www/html/writable" # note the absence of the space between '=' and '"'
chmod 775 "$writable_folder"

/usr/sbin/apache2ctl -D FOREGROUND