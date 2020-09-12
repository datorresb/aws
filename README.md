# AWS

### Create environment

```bash
# Update session
apt-get update
apt-get upgrade
apt-get autoremove

# Install development environment
apt-get install python3-venv
python3 -m venv .py3
```

### Load environment

```bash
source .py3/bin/activate
deactivate
```

> All of the following commands must be execute after activating the virtual environment

### Install

```bash
# Get libraries with
(.py3)$ pip freeze > requirements.txt
# install them using
(.py3)$ pip install -r requirements.txt
```

### Code Style

Install
```
(.py3)$ pip install -U -r requirements.txt
```

Formatting PEP8
```
(.py3)$ ./check_code.sh
```


