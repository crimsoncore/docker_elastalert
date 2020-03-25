#!/bin/sh
python3 -m elastalert.create_index --index elastalert_status --config /opt/elastalert/config/config.yaml
python3 -m elastalert.elastalert --config /opt/elastalert/config/config.yaml --rule /opt/elastalert/rules/ --verbose --start $(date +"%Y-%m-%d")

