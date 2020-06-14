# AWS

### Create environment

```bash
# Install development environment
apt-get update
apt-get install python3-venv
python3 -m venv .venv
```

### Load environment

```bash
source .venv/bin/activate
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

Formatting
```
(.py3)$ ./check_code.sh
```


