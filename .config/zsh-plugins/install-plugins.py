import os

with open('./plugins', 'r') as f:
    for line in f:
        name, repo = line.split(": ")
        if not os.path.exists('./' + name):
            print("Installing " + name + "...")
            os.system('git clone ' + repo)
        else:
            print(name + " already installed, skipping...")
    print("Done.")

