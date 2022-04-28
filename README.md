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
python3 -m venv venv
```

### Load environment

```bash
source venv/bin/activate
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
(venv)$ pip install wheel
(venv)$ pip install notebook
(venv)$ pip install jupyter_contrib_nbextensions
(venv)$ pip install autopep8
(venv)$ pip install jupytext 

```

Prepare kernel on notebook
```bash
pip install ipython
ipython3 kernel install --name "venv" --user
jupyter contrib nbextension install --user

Check: /home/USER/.local/share/jupyter/kernels
```
Prepare notebook ports
```bash
(venv)$ jupyter notebook --generate-config
# modify jupyter_notebook_config.py
(venv)$ nano /home/ubuntu/.jupyter/jupyter_notebook_config.py
#c.NotebookApp.ip = 'localhost' -> c.NotebookApp.ip = '0.0.0.0'
```

Install dependencies
```bash
# Get libraries with
(venv)$ pip freeze > requirements.txt

# install them using
(venv)$ pip install -r requirements.txt
```

### Spyder
```bash
(venv)$ pip install spyder
(venv)$ venv/bin/spyder3
```

### Code Style

Install
```
(venv)$ pip install -U -r requirements.txt
```

Formatting PEP8
```
(venv)$ ./check_code.sh
```

### PySpark

Install Java
```bash
sudo apt install openjdk-8-jdk
# check isntallation with
java -version 
```



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

Download the PostgreSQL JDBC Driver from https://jdbc.postgresql.org/download.html and copy to ```/opt/spark-3.0.1/jars/```

Edit and add export lines
```bash
sudo nano ~/.bashrc
--------------------------------
export SPARK_HOME=/opt/spark
export PATH=$SPARK_HOME/bin:$PATH
export SPARK_CLASSPATH=/opt/spark/jars
```

On python 
```bash
pip install findspark
--------------------------------
import findspark
findspark.init()

# To verify the automatically detected location
findspark.find()

# Add postgresql to Session
from pyspark.sql import SQLContex, SparkSession
spark_db = SparkSession.builder \
    .master('local') \
    .appName('APP') \
    .config('spark.executor.memory', '12gb') \
    .config("spark.cores.max", "10") \
    .config("spark.jars", "postgresql-42.2.18.jar") \
    .getOrCreate()
sc = spark_db.sparkContext
sqlContext = SQLContext(sc)

postgres_url="jdbc:postgresql://{host}:{port}/{db}?user={user}&password={password}"
df_spark.write.jdbc(postgres_url, "table_name", mode="overwrite")
df_sector.write.jdbc(postgres_url, "sector", mode="overwrite")
```

