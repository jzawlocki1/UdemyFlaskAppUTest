#!/bin/bash
. ~/.bashrc

echo '#### Create Python3 Virtual Environment ####'
# source scl_source enable rh-python36
# VIRTUAL_ENV='venvironment'

pyenv versions
pyenv global 3.10.0
python3 -m venv myenv
# python -m venv $VIRTUAL_ENV

echo '#### Checking Python ####'
which python
python3 -v


echo '#### Activate Virtual Environment ####'
source $VIRTUAL_ENV/bin/activate


echo '#### Install requirements ####'
pip install -r ./requirements.txt
pip install pytest-cov

############Jump to that Path####################
# cd /var/lib/jenkins/workspace/$JOB_NAME/

echo '#### Run tests ####'
# pytest utests --junitxml=./xmlReport/output.xml
pytest --cov=main utests --junitxml=./xmlReport/output.xml
python -m coverage xml

 
echo '### deactivate virtual environment and exit SCL ###'
deactivate
echo '#### change pyenv to system ####'
pyenv global system
