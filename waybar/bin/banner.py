#!/usr/bin/env python

import random

messages = (
    " Every second counts!",
    "  Just grind and chill",
)

index = random.randint(0, len(messages) - 1)
print(messages[index])
