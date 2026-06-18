#!/usr/bin/env python

import random

messages = (
    " Every second counts!",
    "  Just chill and keep grinding",
    " Get up and start programming!",
)

index = random.randint(0, len(messages) - 1)
print(messages[index])
