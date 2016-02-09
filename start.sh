#!/bin/bash

chown -R media:users /volumes/config

su - media -c "/usr/bin/sabnzbdplus --config-file /volumes/config --console --server 0.0.0.0:8080"
