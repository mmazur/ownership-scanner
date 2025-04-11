#!/bin/bash

wget https://raw.githubusercontent.com/mmazur/ownership-scanner/refs/heads/main/requirements.txt
wget https://raw.githubusercontent.com/mmazur/ownership-scanner/refs/heads/main/src/ownership_scanner.py

pip install -r requirements.txt

python ./ownership_scanner.py

