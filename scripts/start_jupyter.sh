#!/bin/bash
port=$1
if [ -z "$port" ]
then
  port=8895
fi
host=`hostname`
echo "sft ssh -L localhost:${port}:${host}:${port} raplab-hackathon"

jupyter lab --ip=0.0.0.0 --no-browser --NotebookApp.token='' --port=8895
