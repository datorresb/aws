# AWS EC2

### Create environment

```bash
# Update session

sudo apt-get update
sudo apt-get upgrade
sudo apt-get autoremove

# Install development environment
sudo apt-get install python3-venv

# Create environment
python3 -m venv py3
```

### Load environment

```bash
source py3/bin/activate
deactivate
```

> All of the following commands must be execute after activating the virtual environment

### Useful commands to connect EC2

```bash
# Local commands to connect, upload and download
ssh -i "keypar.pem" ubuntu@DNS
scp -i "keypar.pem" </path/to/file> ubuntu@DNS:/home/ubuntu
pscp -i "keypar.pem"  </path/to/virtual/file> ubuntu@DNS:</destination/local/path>
```

### Prepare Notebooks on EC2 

```bash
# Get notebook with
(py3)$ pip install wheel
(py3)$ pip install notebook
(py3)$ pip install jupyter_contrib_nbextensions
(py3)$ pip isntall autopep8
(py3)$ pip install jupytext 
```

```bash
(py3)$ jupyter notebook --generate-config
# modify jupyter_notebook_config.py
(py3)$ nano /home/ubuntu/.jupyter/jupyter_notebook_config.py
#c.NotebookApp.ip = 'localhost' -> c.NotebookApp.ip = '0.0.0.0'
```

Prepare kernel on notebook
```bash
ipython kernel install --name "py3" --user
```

Install dependencies
```bash
# Get libraries with
(py3)$ pip freeze > requirements.txt

# install them using
(py3)$ pip install -r requirements.txt
```

### Code Style

Install
```
(py3)$ pip install -U -r requirements.txt
```

Formatting PEP8
```
(py3)$ ./check_code.sh
```

### PySpark

Download the most stable http://spark.apache.org/downloads.html
```bash
sudo tar -xzf spark-3.0.1-bin-hadoop2.7.tgz
sudo mv spark-3.0.1-bin-hadoop2.7 /opt/spark-3.0.1
sudo ln -s /opt/spark-3.0.1 /opt/spark
```
Edit and add export lines
```bash
sudo nano ~/.bashrc
--------------------------------
export SPARK_HOME=/opt/spark
export PATH=$SPARK_HOME/bin:$PATH
```


On python 
```bash
pip install findspark
--------------------------------
import findspark
findspark.init()
# To verify the automatically detected location
findspark.find()
```

