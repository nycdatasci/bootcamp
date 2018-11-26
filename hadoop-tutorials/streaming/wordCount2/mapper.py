#!/usr/bin/python
from __future__ import print_function
import sys

def mapper():
    for line in sys.stdin:
        words = line.strip().split()
        for word in words:
            print('{}\t{}'.format(word, 1))

if __name__ == '__main__':
    mapper()
