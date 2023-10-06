import os

with open('./plugins', 'r') as f:
    for line in f:
        name, repo = line.split(": ")
        print("Installing " + name + "...")
        os.system('git clone ' + repo)

