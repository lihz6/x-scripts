#!/usr/bin/env python3
import os, sys

print(os.getcwd())
print(os.environ.get("PATH"))

# [0]: __file__, path to this script
for arg in sys.argv[1:]:  # [1] [2]...
    print(arg)

for line in sys.stdin:
    print(line.strip())

