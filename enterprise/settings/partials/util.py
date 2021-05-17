import os


def get_secret(key):
    if key in os.environ:  # Secret inside environment (Usually dokku)
        return os.environ.get(key)
