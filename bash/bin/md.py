#!/usr/bin/env python

"""
A script for running grip (https://github.com/joeyespo/grip).
"""

# internal
from getpass import getuser
from pathlib import Path
from sys import argv

# third-party
from grip import serve  # type: ignore

USER = getuser()

with open(Path.home().joinpath("grip_access_token.txt")) as path_fd:
    PASSWORD = path_fd.read()

PATH = "README.md"

if len(argv) > 1:
    PATH = argv[1]
print(PATH)

CONTEXT = f"{USER}/{Path.cwd().name}"
print(CONTEXT)

serve(
    path=PATH,
    host="0.0.0.0",
    port=0,
    user_content=True,
    context=CONTEXT,
    username=USER,
    password=PASSWORD,
)
