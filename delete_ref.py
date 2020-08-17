#!/usr/bin/env python3

import os
import sys

assert __name__ == "__main__"
assert len(sys.argv) == 4

pairs = []

with open(sys.argv[1]) as f:
    while True:
        try:
            line = next(f)
        except StopIteration:
            break

        if not line.strip():
            continue

        pair = (line.strip(), next(f).strip())
        assert pair[1]
        pairs.append(pair)

for pair in pairs:
    fst_exists = os.path.exists(os.path.join(sys.argv[3], pair[0]))
    snd_exists = os.path.exists(os.path.join(sys.argv[3], pair[1]))

    if not (fst_exists or snd_exists):
        # Yes, this is hack
        if "From phone" in pair[1]:
            to_rm = os.path.join(sys.argv[2], pair[1])
        else:
            print("Warning: Neither of pair exists in reference:")
            print(pair)

    if not fst_exists:
        to_rm = os.path.join(sys.argv[2], pair[0])
    else:
        to_rm = os.path.join(sys.argv[2], pair[1])

    print("Remove", to_rm)
    os.remove(to_rm)
