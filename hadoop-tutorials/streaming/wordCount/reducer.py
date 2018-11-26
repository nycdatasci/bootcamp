#!/usr/bin/python
from __future__ import print_function
import sys

#variable initialization
current_word = None
current_count = 0
word = None

# takes input stdin
for line in sys.stdin:
    # trim any leading and trailing spaces
    line = line.strip()

    # split the input from mapper.py and take the word and its count
    word, count = line.split('\t', 1)

    # convert count string to int
    try:
        count = int(count)
    except ValueError:
        # in case of exception
        # ignore the exception and discard the input line
        continue

    # this IF-switch only works because Hadoop sorts map output
    # by key (here: word) before it is passed to the reducer
    if current_word == word:
        current_count += count
    else:
        if current_word:
            # write result to STDOUT
            print('{}\t{}'.format(current_word, current_count))
        current_count = count
        current_word = word

# do not forget to output the last word if needed!
if current_word == word:
    print('{}\t{}'.format(current_word, current_count))

