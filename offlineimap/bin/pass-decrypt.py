#! /usr/bin/env python
from subprocess import check_output

def get_pass():
    return check_output(
        "gpg -dq ~/.offlineimappass.gpg",
        shell=True).strip(b"\n")
