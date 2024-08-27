import argparse
import os
import shutil
from pathlib import Path

# Initialize parser
parser = argparse.ArgumentParser(prog="Manager", description="Dotfiles manager")
parser.add_argument("operation", choices=["pull", "apply"])

args = parser.parse_args()

paths = open("paths.txt", "r+")

def pull():
    for line in paths.readlines():
        if line.startswith("#"):
            continue
        line = line.strip()

        if os.path.isdir(f"{os.environ['HOME']}/{line}"):
            if os.path.exists(line):
                shutil.rmtree(line)
            shutil.copytree(f"{os.environ['HOME']}/{line}", line, dirs_exist_ok=True)
        else:
            path = Path(line)
            path.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(f"{os.environ['HOME']}/{line}", line)

def apply():
    for line in paths.readlines():
        if line.startswith("#"):
            continue
        line = line.strip()

        if os.path.isdir(line):
            shutil.copytree(line, f"{os.environ['HOME']}/{line}", dirs_exist_ok=True)
        else:
            path = Path(f"{os.environ['HOME']}/{line}")
            path.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(line, f"{os.environ['HOME']}/{line}")

if args.operation == "pull":
    pull()
elif args.operation == "apply":
    apply()

paths.close()
